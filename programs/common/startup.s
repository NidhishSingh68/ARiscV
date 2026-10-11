.section .text
.globl _start
_start:
    li   t0, 0x00060000
loop:
    li   t1, 1
    sw   t1, 0(t0)

    li   t2, 10
delay1:
    addi t2, t2, -1
    bnez t2, delay1

    sw   zero, 0(t0)

    li   t2, 10 
delay0:
    addi t2, t2, -1
    bnez t2, delay0

    j    loop
