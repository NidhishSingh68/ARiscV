#ifndef RISCV_ARCH_TEST_H
#define RISCV_ARCH_TEST_H

#define RVTEST_BEGIN \
  .section .text.init,"ax",@progbits; \
  .globl _start; \
_start:; \
  la x3, __test_data; \
  la x2, __test_signature

#define RVTEST_TESTDATA_LOAD_INT(_PTR, _REG) \
  lw _REG, 0(_PTR); \
  addi _PTR, _PTR, 4

#define RVTEST_SIGUPD(_SIG, _LINK, _TMP, _RESULT, _LABEL, _STR) \
  sw _RESULT, 0(_SIG); \
  addi _SIG, _SIG, 4

#define RVTEST_CODE_END \
  .word 0x00000073

#define RVTEST_DATA_BEGIN \
  .section .data,"aw",@progbits; \
  .balign 4; \
__test_data:

#define RVTEST_DATA_END \
  .balign 16; \
scratch:; \
  .space 256

#define RVTEST_SIG_SETUP \
  .balign 4; \
  .globl __test_signature; \
__test_signature:; \
  .space SIGUPD_COUNT * 4

#define LI(_REG, _IMM) li _REG, _IMM
#define LA(_REG, _LABEL) la _REG, _LABEL

#define SIG_STRIDE 4
#define REGWIDTH 4
#define LREG lw
#define SREG sw

#endif
