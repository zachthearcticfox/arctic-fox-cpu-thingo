; Bootloader for Arctic Fox OS
org 8000
; Clear Registers
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
ldi r0 8100
ld r0 r1
cmpi r1 afaf
cale kmain
hlt