  beq x0, x29, 1 // perform operation
  beq x1, x22, 1 // perform operation
  beq x2, x17, 1 // perform operation
  beq x3, x23, 1 // perform operation
  beq x4, x23, 1 // perform operation
  beq x5, x4, 1 // perform operation
  beq x6, x11, 1 // perform operation
  beq x7, x15, 1 // perform operation
  beq x8, x2, 1 // perform operation
  beq x9, x4, 1 // perform operation
  beq x10, x1, 1 // perform operation
  beq x11, x8, 1 // perform operation
  beq x12, x30, 1 // perform operation
  beq x13, x24, 1 // perform operation
  beq x14, x31, 1 // perform operation
  beq x15, x7, 1 // perform operation
  beq x16, x24, 1 // perform operation
  beq x17, x10, 1 // perform operation
  beq x18, x29, 1 // perform operation
  beq x19, x26, 1 // perform operation
  beq x20, x15, 1 // perform operation
  beq x21, x17, 1 // perform operation
  beq x22, x9, 1 // perform operation
  beq x23, x20, 1 // perform operation
  beq x24, x2, 1 // perform operation
  beq x25, x31, 1 // perform operation
  beq x26, x15, 1 // perform operation
  beq x27, x19, 1 // perform operation
  beq x28, x19, 1 // perform operation
  beq x29, x0, 1 // perform operation
  beq x30, x11, 1 // perform operation
  beq x31, x11, 1 // perform operation
/////////////////////////////////
// cp_rs2
/////////////////////////////////
  beq x26, x0, 1 // perform operation
  beq x15, x1, 1 // perform operation
  beq x15, x2, 1 // perform operation
  beq x7, x3, 1 // perform operation
  beq x3, x4, 1 // perform operation
  beq x26, x5, 1 // perform operation
  beq x28, x6, 1 // perform operation
  beq x15, x7, 1 // perform operation
  beq x25, x8, 1 // perform operation
  beq x12, x9, 1 // perform operation
  beq x29, x10, 1 // perform operation
  beq x16, x11, 1 // perform operation
  beq x23, x12, 1 // perform operation
  beq x28, x13, 1 // perform operation
  beq x23, x14, 1 // perform operation
  beq x28, x15, 1 // perform operation
  beq x6, x16, 1 // perform operation
  beq x5, x17, 1 // perform operation
  beq x22, x18, 1 // perform operation
  beq x30, x19, 1 // perform operation
  beq x19, x20, 1 // perform operation
  beq x12, x21, 1 // perform operation
  beq x23, x22, 1 // perform operation
  beq x11, x23, 1 // perform operation
  beq x12, x24, 1 // perform operation
  beq x16, x25, 1 // perform operation
  beq x12, x26, 1 // perform operation
  beq x21, x27, 1 // perform operation
  beq x5, x28, 1 // perform operation
  beq x22, x29, 1 // perform operation
  beq x27, x30, 1 // perform operation
  beq x10, x31, 1 // perform operation
/////////////////////////////////
// cp_rs1_edges
/////////////////////////////////
  beq x28, x14, 1 // perform operation
  beq x21, x30, 1 // perform operation
  beq x5, x2, 1 // perform operation
  beq x14, x6, 1 // perform operation
  beq x9, x26, 1 // perform operation
  beq x12, x25, 1 // perform operation
  beq x5, x31, 1 // perform operation
  beq x18, x4, 1 // perform operation
  beq x25, x9, 1 // perform operation
  beq x17, x24, 1 // perform operation
  beq x27, x23, 1 // perform operation
  beq x16, x1, 1 // perform operation
/////////////////////////////////
// cp_rs2_edges
/////////////////////////////////
  beq x22, x9, 1 // perform operation
  beq x10, x31, 1 // perform operation
  beq x15, x21, 1 // perform operation
  beq x30, x1, 1 // perform operation
  beq x17, x27, 1 // perform operation
  beq x14, x21, 1 // perform operation
  beq x18, x10, 1 // perform operation
  beq x1, x21, 1 // perform operation
  beq x9, x17, 1 // perform operation
  beq x31, x15, 1 // perform operation
  beq x14, x15, 1 // perform operation
  beq x6, x15, 1 // perform operation
/////////////////////////////////
// cr_rs1_rs2_edges_offset
/////////////////////////////////
  beq x16, x23, 3f // forward branch, if taken
  beq x16, x23, 0 // backward branch, never taken
  beq x16, x23, -2 // backward branch, definitely taken
  beq x1, x14, 3f // forward branch, if taken
  beq x1, x14, 0 // backward branch, never taken
  beq x1, x14, -2 // backward branch, definitely taken
  beq x18, x4, 3f // forward branch, if taken
  beq x18, x4, 0 // backward branch, never taken
  beq x18, x4, -2 // backward branch, definitely taken
  beq x23, x6, 3f // forward branch, if taken
  beq x23, x6, 0b // backward branch, never taken
  beq x23, x6, 2b // backward branch, definitely taken
  beq x2, x5, 3f // forward branch, if taken
  beq x2, x5, 0b // backward branch, never taken
  beq x2, x5, 2b // backward branch, definitely taken
  beq x22, x15, 3f // forward branch, if taken
  beq x22, x15, 0b // backward branch, never taken
  beq x22, x15, 2b // backward branch, definitely taken
  beq x12, x5, 3f // forward branch, if taken
  beq x12, x5, 0b // backward branch, never taken
  beq x12, x5, 2b // backward branch, definitely taken
  beq x13, x4, 3f // forward branch, if taken
  beq x13, x4, 0b // backward branch, never taken
  beq x13, x4, 2b // backward branch, definitely taken
  beq x26, x12, 3f // forward branch, if taken
  beq x26, x12, 0b // backward branch, never taken
  beq x26, x12, 2b // backward branch, definitely taken
  beq x22, x19, 3f // forward branch, if taken
  beq x22, x19, 0b // backward branch, never taken
  beq x22, x19, 2b // backward branch, definitely taken
  beq x19, x10, 3f // forward branch, if taken
  beq x19, x10, 0b // backward branch, never taken
  beq x19, x10, 2b // backward branch, definitely taken
  beq x13, x18, 3f // forward branch, if taken
  beq x13, x18, 0b // backward branch, never taken
  beq x13, x18, 2b // backward branch, definitely taken
  beq x1, x26, 3f // forward branch, if taken
  beq x1, x26, 0b // backward branch, never taken
  beq x1, x26, 2b // backward branch, definitely taken
  beq x21, x10, 3f // forward branch, if taken
  beq x21, x10, 0b // backward branch, never taken
  beq x21, x10, 2b // backward branch, definitely taken
  beq x4, x2, 3f // forward branch, if taken
  beq x4, x2, 0b // backward branch, never taken
  beq x4, x2, 2b // backward branch, definitely taken
  beq x14, x30, 3f // forward branch, if taken
  beq x14, x30, 0b // backward branch, never taken
  beq x14, x30, 2b // backward branch, definitely taken
  beq x24, x1, 3f // forward branch, if taken
  beq x24, x1, 0b // backward branch, never taken
  beq x24, x1, 2b // backward branch, definitely taken
  beq x29, x6, 3f // forward branch, if taken
  beq x29, x6, 0b // backward branch, never taken
  beq x29, x6, 2b // backward branch, definitely taken
  beq x16, x9, 3f // forward branch, if taken
  beq x16, x9, 0b // backward branch, never taken
  beq x16, x9, 2b // backward branch, definitely taken
  beq x17, x29, 3f // forward branch, if taken
  beq x17, x29, 0b // backward branch, never taken
  beq x17, x29, 2b // backward branch, definitely taken
  beq x10, x23, 3f // forward branch, if taken
  beq x10, x23, 0b // backward branch, never taken
  beq x10, x23, 2b // backward branch, definitely taken
  beq x26, x4, 3f // forward branch, if taken
  beq x26, x4, 0b // backward branch, never taken
  beq x26, x4, 2b // backward branch, definitely taken
  beq x18, x16, 3f // forward branch, if taken
  beq x18, x16, 0b // backward branch, never taken
  beq x18, x16, 2b // backward branch, definitely taken
  beq x29, x31, 3f // forward branch, if taken
  beq x29, x31, 0b // backward branch, never taken
  beq x29, x31, 2b // backward branch, definitely taken
  beq x21, x12, 3f // forward branch, if taken
  beq x21, x12, 0b // backward branch, never taken
  beq x21, x12, 2b // backward branch, definitely taken
  beq x1, x15, 3f // forward branch, if taken
  beq x1, x15, 0b // backward branch, never taken
  beq x1, x15, 2b // backward branch, definitely taken
  beq x17, x26, 3f // forward branch, if taken
  beq x17, x26, 0b // backward branch, never taken
  beq x17, x26, 2b // backward branch, definitely taken
  beq x18, x23, 3f // forward branch, if taken
  beq x18, x23, 0b // backward branch, never taken
  beq x18, x23, 2b // backward branch, definitely taken
  beq x13, x27, 3f // forward branch, if taken
  beq x13, x27, 0b // backward branch, never taken
  beq x13, x27, 2b // backward branch, definitely taken
  beq x14, x1, 3f // forward branch, if taken
  beq x14, x1, 0b // backward branch, never taken
  beq x14, x1, 2b // backward branch, definitely taken
  beq x2, x30, 3f // forward branch, if taken
  beq x2, x30, 0b // backward branch, never taken
  beq x2, x30, 2b // backward branch, definitely taken
  beq x27, x26, 3f // forward branch, if taken
  beq x27, x26, 0b // backward branch, never taken
  beq x27, x26, 2b // backward branch, definitely taken
  beq x10, x16, 3f // forward branch, if taken
  beq x10, x16, 0b // backward branch, never taken
  beq x10, x16, 2b // backward branch, definitely taken
  beq x23, x18, 3f // forward branch, if taken
  beq x23, x18, 0b // backward branch, never taken
  beq x23, x18, 2b // backward branch, definitely taken
  beq x1, x23, 3f // forward branch, if taken
  beq x1, x23, 0b // backward branch, never taken
  beq x1, x23, 2b // backward branch, definitely taken
  beq x21, x27, 3f // forward branch, if taken
  beq x21, x27, 0b // backward branch, never taken
  beq x21, x27, 2b // backward branch, definitely taken
  beq x27, x16, 3f // forward branch, if taken
  beq x27, x16, 0b // backward branch, never taken
  beq x27, x16, 2b // backward branch, definitely taken
  beq x6, x5, 3f // forward branch, if taken
  beq x6, x5, 0b // backward branch, never taken
  beq x6, x5, 2b // backward branch, definitely taken
  beq x28, x16, 3f // forward branch, if taken
  beq x28, x16, 0b // backward branch, never taken
  beq x28, x16, 2b // backward branch, definitely taken
  beq x28, x24, 3f // forward branch, if taken
  beq x28, x24, 0b // backward branch, never taken
  beq x28, x24, 2b // backward branch, definitely taken
  beq x22, x29, 3f // forward branch, if taken
  beq x22, x29, 0b // backward branch, never taken
  beq x22, x29, 2b // backward branch, definitely taken
  beq x31, x23, 3f // forward branch, if taken
  beq x31, x23, 0b // backward branch, never taken
  beq x31, x23, 2b // backward branch, definitely taken
  beq x12, x4, 3f // forward branch, if taken
  beq x12, x4, 0b // backward branch, never taken
  beq x12, x4, 2b // backward branch, definitely taken
  beq x30, x4, 3f // forward branch, if taken
  beq x30, x4, 0b // backward branch, never taken
  beq x30, x4, 2b // backward branch, definitely taken
  beq x30, x18, 3f // forward branch, if taken
  beq x30, x18, 0b // backward branch, never taken
  beq x30, x18, 2b // backward branch, definitely taken
  beq x19, x2, 3f // forward branch, if taken
  beq x19, x2, 0b // backward branch, never taken
  beq x19, x2, 2b // backward branch, definitely taken
  beq x28, x13, 3f // forward branch, if taken
  beq x28, x13, 0b // backward branch, never taken
  beq x28, x13, 2b // backward branch, definitely taken
  beq x2, x25, 3f // forward branch, if taken
  beq x2, x25, 0b // backward branch, never taken
  beq x2, x25, 2b // backward branch, definitely taken
  beq x28, x24, 3f // forward branch, if taken
  beq x28, x24, 0b // backward branch, never taken
  beq x28, x24, 2b // backward branch, definitely taken
  beq x30, x28, 3f // forward branch, if taken
  beq x30, x28, 0b // backward branch, never taken
  beq x30, x28, 2b // backward branch, definitely taken
  beq x4, x27, 3f // forward branch, if taken
  beq x4, x27, 0b // backward branch, never taken
  beq x4, x27, 2b // backward branch, definitely taken
  beq x3, x19, 3f // forward branch, if taken
  beq x3, x19, 0b // backward branch, never taken
  beq x3, x19, 2b // backward branch, definitely taken
  beq x12, x6, 3f // forward branch, if taken
  beq x12, x6, 0b // backward branch, never taken
  beq x12, x6, 2b // backward branch, definitely taken
  beq x2, x10, 3f // forward branch, if taken
  beq x2, x10, 0b // backward branch, never taken
  beq x2, x10, 2b // backward branch, definitely taken
  beq x13, x18, 3f // forward branch, if taken
  beq x13, x18, 0b // backward branch, never taken
  beq x13, x18, 2b // backward branch, definitely taken
  beq x13, x6, 3f // forward branch, if taken
  beq x13, x6, 0b // backward branch, never taken
  beq x13, x6, 2b // backward branch, definitely taken
  beq x18, x14, 3f // forward branch, if taken
  beq x18, x14, 0b // backward branch, never taken
  beq x18, x14, 2b // backward branch, definitely taken
  beq x6, x14, 3f // forward branch, if taken
  beq x6, x14, 0b // backward branch, never taken
  beq x6, x14, 2b // backward branch, definitely taken
  beq x14, x17, 3f // forward branch, if taken
  beq x14, x17, 0b // backward branch, never taken
  beq x14, x17, 2b // backward branch, definitely taken
  beq x24, x26, 3f // forward branch, if taken
  beq x24, x26, 0b // backward branch, never taken
  beq x24, x26, 2b // backward branch, definitely taken
  beq x29, x14, 3f // forward branch, if taken
  beq x29, x14, 0b // backward branch, never taken
  beq x29, x14, 2b // backward branch, definitely taken
  beq x10, x13, 3f // forward branch, if taken
  beq x10, x13, 0b // backward branch, never taken
  beq x10, x13, 2b // backward branch, definitely taken
  beq x1, x6, 3f // forward branch, if taken
  beq x1, x6, 0b // backward branch, never taken
  beq x1, x6, 2b // backward branch, definitely taken
  beq x23, x2, 3f // forward branch, if taken
  beq x23, x2, 0b // backward branch, never taken
  beq x23, x2, 2b // backward branch, definitely taken
  beq x2, x24, 3f // forward branch, if taken
  beq x2, x24, 0b // backward branch, never taken
  beq x2, x24, 2b // backward branch, definitely taken
  beq x25, x16, 3f // forward branch, if taken
  beq x25, x16, 0b // backward branch, never taken
  beq x25, x16, 2b // backward branch, definitely taken
  beq x1, x3, 3f // forward branch, if taken
  beq x1, x3, 0b // backward branch, never taken
  beq x1, x3, 2b // backward branch, definitely taken
  beq x16, x4, 3f // forward branch, if taken
  beq x16, x4, 0b // backward branch, never taken
  beq x16, x4, 2b // backward branch, definitely taken
  beq x3, x15, 3f // forward branch, if taken
  beq x3, x15, 0b // backward branch, never taken
  beq x3, x15, 2b // backward branch, definitely taken
  beq x19, x31, 3f // forward branch, if taken
  beq x19, x31, 0b // backward branch, never taken
  beq x19, x31, 2b // backward branch, definitely taken
  beq x28, x23, 3f // forward branch, if taken
  beq x28, x23, 0b // backward branch, never taken
  beq x28, x23, 2b // backward branch, definitely taken
  beq x28, x19, 3f // forward branch, if taken
  beq x28, x19, 0b // backward branch, never taken
  beq x28, x19, 2b // backward branch, definitely taken
  beq x12, x10, 3f // forward branch, if taken
  beq x12, x10, 0b // backward branch, never taken
  beq x12, x10, 2b // backward branch, definitely taken
  beq x17, x27, 3f // forward branch, if taken
  beq x17, x27, 0b // backward branch, never taken
  beq x17, x27, 2b // backward branch, definitely taken
  beq x9, x13, 3f // forward branch, if taken
  beq x9, x13, 0b // backward branch, never taken
  beq x9, x13, 2b // backward branch, definitely taken
  beq x29, x24, 3f // forward branch, if taken
  beq x29, x24, 0b // backward branch, never taken
  beq x29, x24, 2b // backward branch, definitely taken
  beq x28, x2, 3f // forward branch, if taken
  beq x28, x2, 0b // backward branch, never taken
  beq x28, x2, 2b // backward branch, definitely taken
  beq x31, x14, 3f // forward branch, if taken
  beq x31, x14, 0b // backward branch, never taken
  beq x31, x14, 2b // backward branch, definitely taken
  beq x24, x9, 3f // forward branch, if taken
  beq x24, x9, 0b // backward branch, never taken
  beq x24, x9, 2b // backward branch, definitely taken
  beq x26, x1, 3f // forward branch, if taken
  beq x26, x1, 0b // backward branch, never taken
  beq x26, x1, 2b // backward branch, definitely taken
  beq x28, x10, 3f // forward branch, if taken
  beq x28, x10, 0b // backward branch, never taken
  beq x28, x10, 2b // backward branch, definitely taken
  beq x17, x18, 3f // forward branch, if taken
  beq x17, x18, 0b // backward branch, never taken
  beq x17, x18, 2b // backward branch, definitely taken
  beq x14, x3, 3f // forward branch, if taken
  beq x14, x3, 0b // backward branch, never taken
  beq x14, x3, 2b // backward branch, definitely taken
  beq x30, x29, 3f // forward branch, if taken
  beq x30, x29, 0b // backward branch, never taken
  beq x30, x29, 2b // backward branch, definitely taken
  beq x29, x3, 3f // forward branch, if taken
  beq x29, x3, 0b // backward branch, never taken
  beq x29, x3, 2b // backward branch, definitely taken
  beq x2, x17, 3f // forward branch, if taken
  beq x2, x17, 0b // backward branch, never taken
  beq x2, x17, 2b // backward branch, definitely taken
  beq x28, x13, 3f // forward branch, if taken
  beq x28, x13, 0b // backward branch, never taken
  beq x28, x13, 2b // backward branch, definitely taken
  beq x10, x22, 3f // forward branch, if taken
  beq x10, x22, 0b // backward branch, never taken
  beq x10, x22, 2b // backward branch, definitely taken
  beq x3, x26, 3f // forward branch, if taken
  beq x3, x26, 0b // backward branch, never taken
  beq x3, x26, 2b // backward branch, definitely taken
  beq x17, x14, 3f // forward branch, if taken
  beq x17, x14, 0b // backward branch, never taken
  beq x17, x14, 2b // backward branch, definitely taken
  beq x3, x17, 3f // forward branch, if taken
  beq x3, x17, 0b // backward branch, never taken
  beq x3, x17, 2b // backward branch, definitely taken
  beq x16, x24, 3f // forward branch, if taken
  beq x16, x24, 0b // backward branch, never taken
  beq x16, x24, 2b // backward branch, definitely taken
  beq x25, x15, 3f // forward branch, if taken
  beq x25, x15, 0b // backward branch, never taken
  beq x25, x15, 2b // backward branch, definitely taken
  beq x6, x14, 3f // forward branch, if taken
  beq x6, x14, 0b // backward branch, never taken
  beq x6, x14, 2b // backward branch, definitely taken
  beq x13, x26, 3f // forward branch, if taken
  beq x13, x26, 0b // backward branch, never taken
  beq x13, x26, 2b // backward branch, definitely taken
  beq x14, x25, 3f // forward branch, if taken
  beq x14, x25, 0b // backward branch, never taken
  beq x14, x25, 2b // backward branch, definitely taken
  beq x21, x29, 3f // forward branch, if taken
  beq x21, x29, 0b // backward branch, never taken
  beq x21, x29, 2b // backward branch, definitely taken
  beq x18, x3, 3f // forward branch, if taken
  beq x18, x3, 0b // backward branch, never taken
  beq x18, x3, 2b // backward branch, definitely taken
  beq x31, x6, 3f // forward branch, if taken
  beq x31, x6, 0b // backward branch, never taken
  beq x31, x6, 2b // backward branch, definitely taken
  beq x13, x4, 3f // forward branch, if taken
  beq x13, x4, 0b // backward branch, never taken
  beq x13, x4, 2b // backward branch, definitely taken
  beq x4, x10, 3f // forward branch, if taken
  beq x4, x10, 0b // backward branch, never taken
  beq x4, x10, 2b // backward branch, definitely taken
  beq x26, x1, 3f // forward branch, if taken
  beq x26, x1, 0b // backward branch, never taken
  beq x26, x1, 2b // backward branch, definitely taken
  beq x30, x3, 3f // forward branch, if taken
  beq x30, x3, 0b // backward branch, never taken
  beq x30, x3, 2b // backward branch, definitely taken
  beq x31, x15, 3f // forward branch, if taken
  beq x31, x15, 0b // backward branch, never taken
  beq x31, x15, 2b // backward branch, definitely taken
  beq x16, x31, 3f // forward branch, if taken
  beq x16, x31, 0b // backward branch, never taken
  beq x16, x31, 2b // backward branch, definitely taken
  beq x19, x15, 3f // forward branch, if taken
  beq x19, x15, 0b // backward branch, never taken
  beq x19, x15, 2b // backward branch, definitely taken
  beq x10, x16, 3f // forward branch, if taken
  beq x10, x16, 0b // backward branch, never taken
  beq x10, x16, 2b // backward branch, definitely taken
  beq x17, x30, 3f // forward branch, if taken
  beq x17, x30, 0b // backward branch, never taken
  beq x17, x30, 2b // backward branch, definitely taken
  beq x1, x31, 3f // forward branch, if taken
  beq x1, x31, 0b // backward branch, never taken
  beq x1, x31, 2b // backward branch, definitely taken
  beq x5, x1, 3f // forward branch, if taken
  beq x5, x1, 0b // backward branch, never taken
  beq x5, x1, 2b // backward branch, definitely taken
  beq x5, x15, 3f // forward branch, if taken
  beq x5, x15, 0b // backward branch, never taken
  beq x5, x15, 2b // backward branch, definitely taken
  beq x2, x24, 3f // forward branch, if taken
  beq x2, x24, 0b // backward branch, never taken
  beq x2, x24, 2b // backward branch, definitely taken
  beq x16, x27, 3f // forward branch, if taken
  beq x16, x27, 0b // backward branch, never taken
  beq x16, x27, 2b // backward branch, definitely taken
  beq x2, x18, 3f // forward branch, if taken
  beq x2, x18, 0b // backward branch, never taken
  beq x2, x18, 2b // backward branch, definitely taken
  beq x31, x10, 3f // forward branch, if taken
  beq x31, x10, 0b // backward branch, never taken
  beq x31, x10, 2b // backward branch, definitely taken
  beq x5, x28, 3f // forward branch, if taken
  beq x5, x28, 0b // backward branch, never taken
  beq x5, x28, 2b // backward branch, definitely taken
  beq x13, x26, 3f // forward branch, if taken
  beq x13, x26, 0b // backward branch, never taken
  beq x13, x26, 2b // backward branch, definitely taken
  beq x17, x25, 3f // forward branch, if taken
  beq x17, x25, 0b // backward branch, never taken
  beq x17, x25, 2b // backward branch, definitely taken
  beq x27, x4, 3f // forward branch, if taken
  beq x27, x4, 0b // backward branch, never taken
  beq x27, x4, 2b // backward branch, definitely taken
  beq x10, x22, 3f // forward branch, if taken
  beq x10, x22, 0b // backward branch, never taken
  beq x10, x22, 2b // backward branch, definitely taken
  beq x2, x15, 3f // forward branch, if taken
  beq x2, x15, 0b // backward branch, never taken
  beq x2, x15, 2b // backward branch, definitely taken
  beq x3, x2, 3f // forward branch, if taken
  beq x3, x2, 0b // backward branch, never taken
  beq x3, x2, 2b // backward branch, definitely taken
  beq x18, x5, 3f // forward branch, if taken
  beq x18, x5, 0b // backward branch, never taken
  beq x18, x5, 2b // backward branch, definitely taken
  beq x18, x14, 3f // forward branch, if taken
  beq x18, x14, 0b // backward branch, never taken
  beq x18, x14, 2b // backward branch, definitely taken
  beq x26, x6, 3f // forward branch, if taken
  beq x26, x6, 0b // backward branch, never taken
  beq x26, x6, 2b // backward branch, definitely taken
  beq x15, x3, 3f // forward branch, if taken
  beq x15, x3, 0b // backward branch, never taken
  beq x15, x3, 2b // backward branch, definitely taken
  beq x28, x1, 3f // forward branch, if taken
  beq x28, x1, 0b // backward branch, never taken
  beq x28, x1, 2b // backward branch, definitely taken
  beq x18, x27, 3f // forward branch, if taken
  beq x18, x27, 0b // backward branch, never taken
  beq x18, x27, 2b // backward branch, definitely taken
  beq x28, x9, 3f // forward branch, if taken
  beq x28, x9, 0b // backward branch, never taken
  beq x28, x9, 2b // backward branch, definitely taken
  beq x4, x3, 3f // forward branch, if taken
  beq x4, x3, 0b // backward branch, never taken
  beq x4, x3, 2b // backward branch, definitely taken
  beq x1, x2, 3f // forward branch, if taken
  beq x1, x2, 0b // backward branch, never taken
  beq x1, x2, 2b // backward branch, definitely taken
  beq x15, x10, 3f // forward branch, if taken
  beq x15, x10, 0b // backward branch, never taken
  beq x15, x10, 2b // backward branch, definitely taken
  beq x23, x5, 3f // forward branch, if taken
  beq x23, x5, 0b // backward branch, never taken
  beq x23, x5, 2b // backward branch, definitely taken
  beq x31, x25, 3f // forward branch, if taken
  beq x31, x25, 0b // backward branch, never taken
  beq x31, x25, 2b // backward branch, definitely taken
  beq x17, x18, 3f // forward branch, if taken
  beq x17, x18, 0b // backward branch, never taken
  beq x17, x18, 2b // backward branch, definitely taken
  beq x29, x28, 3f // forward branch, if taken
  beq x29, x28, 0b // backward branch, never taken
  beq x29, x28, 2b // backward branch, definitely taken
  beq x5, x17, 3f // forward branch, if taken
  beq x5, x17, 0b // backward branch, never taken
  beq x5, x17, 2b // backward branch, definitely taken
  beq x10, x30, 3f // forward branch, if taken
  beq x10, x30, 0b // backward branch, never taken
  beq x10, x30, 2b // backward branch, definitely taken
  beq x13, x1, 3f // forward branch, if taken
  beq x13, x1, 0b // backward branch, never taken
  beq x13, x1, 2b // backward branch, definitely taken
  beq x23, x1, 3f // forward branch, if taken
  beq x23, x1, 0b // backward branch, never taken
  beq x23, x1, 2b // backward branch, definitely taken
  beq x21, x16, 3f // forward branch, if taken
  beq x21, x16, 0b // backward branch, never taken
  beq x21, x16, 2b // backward branch, definitely taken
  beq x10, x9, 3f // forward branch, if taken
  beq x10, x9, 0b // backward branch, never taken
  beq x10, x9, 2b // backward branch, definitely taken
  beq x5, x18, 3f // forward branch, if taken
  beq x5, x18, 0b // backward branch, never taken
  beq x5, x18, 2b // backward branch, definitely taken
  beq x12, x10, 3f // forward branch, if taken
  beq x12, x10, 0b // backward branch, never taken
  beq x12, x10, 2b // backward branch, definitely taken
/////////////////////////////////
// cmp_rs1_rs2
/////////////////////////////////
  beq x0, x0, 1 // perform operation
  beq x1, x1, 1 // perform operation
  beq x2, x2, 1 // perform operation
  beq x3, x3, 1 // perform operation
  beq x4, x4, 1 // perform operation
  beq x5, x5, 1 // perform operation
  beq x6, x6, 1 // perform operation
  beq x7, x7, 1 // perform operation
  beq x8, x8, 1 // perform operation
  beq x9, x9, 1 // perform operation
  beq x10, x10, 1 // perform operation
  beq x11, x11, 1 // perform operation
  beq x12, x12, 1 // perform operation
  beq x13, x13, 1 // perform operation
  beq x14, x14, 1 // perform operation
  beq x15, x15, 1 // perform operation
  beq x16, x16, 1 // perform operation
  beq x17, x17, 1 // perform operation
  beq x18, x18, 1 // perform operation
  beq x19, x19, 1 // perform operation
  beq x20, x20, 1 // perform operation
  beq x21, x21, 1 // perform operation
  beq x22, x22, 1 // perform operation
  beq x23, x23, 1 // perform operation
  beq x24, x24, 1 // perform operation
  beq x25, x25, 1 // perform operation
  beq x26, x26, 1 // perform operation
  beq x27, x27, 1 // perform operation
  beq x28, x28, 1 // perform operation
  beq x29, x29, 1 // perform operation
  beq x30, x30, 1 // perform operation
  beq x31, x31, 1 // perform operation
/////////////////////////////////
// cp_offset
/////////////////////////////////
/////////////////////////////////
// cp_imm_edges_branch
/////////////////////////////////
  beq x18, x13, 1
  beq x18, x13, 2
  beq x18, x13, 3
  beq x18, x13, 4
  beq x18, x13, 5
// Instantiate trap handlers and other epilog code, call RVMODEL_HALT at end of test
// Create scratch data sections and label for test data
// Test data
// Testcase strings
// End of test data section and model specific data
// Signature region for self-checking
