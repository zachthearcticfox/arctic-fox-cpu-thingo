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
soi 6e0d a
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
soi ffff 1
soi ffff 0
soi 6e23 'A'
soi 6e24 'r'
soi 6e25 'c'
soi 6e26 't'
soi 6e27 'i'
soi 6e28 'c'
soi 6e29 ' '
soi 6e2a 'F'
soi 6e2b 'o'
soi 6e2c 'x'
soi 6e2d ' '
soi 6e2e 'O'
soi 6e2f 'S'
soi 6e30 a
soi 6e31 'C'
soi 6e32 'h'
soi 6e33 'e'
soi 6e34 'c'
soi 6e35 'k'
soi 6e36 'i'
soi 6e37 'n'
soi 6e38 'g'
soi 6e39 ' '
soi 6e3a 'i'
soi 6e3b 'f'
soi 6e3c ' '
soi 6e3d 'k'
soi 6e3e 'e'
soi 6e3f 'r'
soi 6e40 'n'
soi 6e41 'e'
soi 6e42 'l'
soi 6e43 ' '
soi 6e44 'i'
soi 6e45 's'
soi 6e46 ' '
soi 6e47 'o'
soi 6e48 'k'
call kputs

ldi r0 8100
ld r0 r1
cmpi r1 afaf
call kcltty
cale kmain
hlt