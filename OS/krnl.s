; echo <text> - output parameter 1 [unfinished]
; chkram - checks if ram is working well [unfinished]
; reboot - reboots the os [unfinished]
; clear - clear the display [unfinished]
; pwroff - turn the cpu off [unfinished]

org 8100
dfw afaf ;magic number
macro CHAR_LOCATION_STORAGE 7fff

; char location storage will be at 0x7fff
ldi r0 ff00
ldi r1 7fff
str r1 r0

srt kputc ;b0 = character, stores it in ff00-fffe (tty memory)
  ldi r1 CHAR_LOCATION_STORAGE
  ld r1 r2
  str r2 b0
  addi r2 r2 1
  str r2 r1
ret

srt kputs ;r0 = string start address, b0 = string length
  ldi b1 0 ;b1 is loop counter
  .puts_loop:
    ld r0 r1
    lmi CHAR_LOCATION_STORAGE r3
    str r1 r3
    addi b1 b1 1
    addi r0 r0 1
    cmp b1 b0
    bne .puts_loop
    bng .puts_loop
ret

srt kreboot ;reboot the system - 0x8000 is where bootloader is stored
  soi 6f00 'R' ;loads 'R' into 6f00
  soi 6f01 'e' ;...
  soi 6f02 'b'
  soi 6f03 'o'
  soi 6f04 'o'
  soi 6f05 't'
  soi 6f06 'i'
  soi 6f07 'n'
  soi 6f08 'g'
  soi 6f09 '.'
  soi 6f0a '.' ;...
  soi 6f0b '.' ;loads '.' into 6f0b
  ldi r0 6f00
  ldi b0 b
  call kputs
  brh 8000
ret

str kcltty ;clears the terminal - 0xffff is tty clear signal
  soi ffff 1
  soi ffff 0
ret

srt kgetc ;gets a character from user input - stores character in b0, reads key from 0xfeff since that is where it is stored
  lmi feff b1
  cmpi b1 0000
  beq .nochar
  brh .char 
  .nochar:
    jmp 0
  .char:
    mov b0 b1
    ldi b1 0
ret

srt kmain ;main kernel routine - handles commands
  ; command buffer: 7f10-7f3f

  ldi r6 7f10

  .get_userinput_loop:
    call kgetc
    cmpi b0 d
    beq .end_input

    call kputc
    str r6 b0
    addi r6 r6 1
    brh .get_userinput_loop

  .end_input:
    ldi b0 0
    str r6 b0

    ldi r6 7f10
    .echo_loop:
      ld r6 r5
      cmpi r5 0
      beq .loop_done
      mov b0 r5
      call kputc
      addi r6 r6 1
      brh .echo_loop

    .loop_done:
      brh .get_userinput_loop
ret