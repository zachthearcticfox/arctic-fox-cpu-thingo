; Bootloader for Arctic Fox OS
org 8000
; Clear Registers
soi 6e00 'A'
soi 6e01 'r'
soi 6e02 'c'
soi 6e03 't'
soi 6e04 'i'
soi 6e05 'c'
soi 6e06 ' '
soi 6e07 'F'
soi 6e08 'o'
soi 6e09 'x'
soi 6e0a ' '
soi 6e0b 'O'
soi 6e0c 'S'
soi 6e0d '\n'
soi 6e0e 'C'
soi 6e0f 'l'
soi 6e10 'e'
soi 6e11 'a'
soi 6e12 'r'
soi 6e13 'i'
soi 6e14 'n'
soi 6e15 'g'
soi 6e16 ' '
soi 6e17 'R'
soi 6e18 'e'
soi 6e19 'g'
soi 6e1a 'i'
soi 6e1b 's'
soi 6e1c 't'
soi 6e1d 'e'
soi 6e1e 'r'
soi 6e1f 's'
soi 6e20 '.'
soi 6e21 '.'
soi 6e22 '.'
call kputs

ldi r0 0
ldi r1 0
ldi r2 0
ldi r3 0
ldi r4 0
ldi r5 0
ldi r6 0
ldi r7 0
ldi r8 0
ldi r9 0
ldi ra 0
ldi rb 0
ldi rc 0
ldi rd 0
ldi re 0
ldi rf 0
ldi b0 0
ldi b1 0
ldi b2 0
ldi b3 0
ldi b4 0
ldi b5 0
ldi b6 0
ldi b7 0
ldi b8 0
ldi b9 0
ldi ba 0
ldi bb 0
ldi bc 0
ldi bd 0
ldi be 0
ldi bf 0
; Check if kernel is valid and start kernel
soi 6e0e 'C'
soi 6e0f 'h'
soi 6e10 'e'
soi 6e11 'c'
soi 6e12 'k'
soi 6e13 'i'
soi 6e14 'n'
soi 6e15 'g'
soi 6e16 ' '
soi 6e17 'i'
soi 6e18 'f'
soi 6e19 ' '
soi 6e1a 'k'
soi 6e1b 'e'
soi 6e1c 'r'
soi 6e1d 'n'
soi 6e1e 'e'
soi 6e1f 'l'
soi 6e20 ' '
soi 6e21 'i'
soi 6e22 's'
soi 6e23 ' '
soi 6e24 'o'
soi 6e25 'k'
soi 6e26 '.'
soi 6e27 '.'
soi 6e28 '.'
call kputs

ldi r0 8100
ld r0 r1
cmpi r1 afaf
call kcltty
cale kmain
hlt