.global main

.text
.balign 8
main:
    /* register exception handler */
    la a0, handler
    csrw mtvec, a0
    /* enable tbi and mte */
    li a0, 0x1
    csrw 0x8c0, a0
    /* set tag for test_data */
    la a1, test_data
    li a2, 0x5A
    st a2, 0(a1)
    addi a2, a2, 0x10
    /* prepare faulty tagged address */
    slli a2, a2, 56
    or a2, a2, a1
    /* load data with tagged address and get exception */
    ld a3, 0(a2)
    j fail

success:
    li a0, 0
    /* writing to 0x8c3 csr makes qemu to exit */
    csrw 0x8c3, a0

fail:
    li a0, 1
    /* writing to 0x8c3 csr makes qemu to exit */
    csrw 0x8c3, a0

handler:
    /* read fault reason */
    csrr a7, mcause
    /* check if it's secure monitor fault */
    li a6, 0x10
    beq a6, a7, success
    j fail

.align 8
test_data:
.byte 0x12345678
