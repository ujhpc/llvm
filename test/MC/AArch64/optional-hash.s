// PR18929
// RUN: llvm-mc < %s -triple=aarch64-linux-gnueabi -mattr=+fp-armv8,+neon -filetype=obj -o - \
// RUN: | llvm-objdump --disassemble -arch=aarch64 -mattr=+fp-armv8,+neon - | FileCheck %s

// RUN: llvm-mc < %s -triple=arm64-linux-gnueabi -mattr=+fp-armv8,+neon -filetype=obj -o - \
// RUN: | llvm-objdump --disassemble -arch=arm64 -mattr=+fp-armv8,+neon - | FileCheck %s

    .text
// CHECK: cmp w0, #123
    cmp w0, 123
// CHECK: fmov s0, #1.06250000
    fmov s0, 1.0625
// CHECK: fcmp s0, #0.0
    fcmp s0, 0.0
// CHECK: cmgt v0.8b, v15.8b, #0
    cmgt v0.8b, v15.8b, 0
// CHECK: fcmeq v0.2s, v31.2s, #0.0
    fcmeq v0.2s, v31.2s, 0.0
l1:
l2:
