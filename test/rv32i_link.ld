ENTRY(_start)

SECTIONS
{
  . = 0;
  .text : { *(.text.init) *(.text*) }
  . = ALIGN(4);
  .data : { *(.data*) *(.rodata*) }
  .bss : { *(.bss*) *(COMMON) }
}
