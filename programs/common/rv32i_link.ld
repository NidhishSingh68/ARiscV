ENTRY(_start)
MEMORY
{
  RAM    (xrw)    : ORIGIN = 0x00000000,   LENGTH = 96K
  FLASH    (rx)    : ORIGIN = 0x00000000,   LENGTH = 16K
}

SECTIONS
{
  . = 0;
  .text :
  {
    . = ALIGN(4);
    *(.text)           /* .text sections (code) */
    *(.text*)          /* .text* sections (code) */
    . = ALIGN(4);
  } >FLASH

  .data : { *(.data*) *(.rodata*) } >RAM
  .bss : { *(.bss*) *(COMMON) } >RAM
}
