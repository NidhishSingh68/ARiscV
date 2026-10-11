.section .text
.globl _start
_start:
    la   sp, _RAM_SIZE 
    j main
