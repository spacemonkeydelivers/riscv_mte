.global main

.text
.balign 8
main:
    /* enable tbi and mte */
    li a0, 0x1
    csrw 0x8c0, a0
    /* set tag for test_data */
    la a1, test_data
    li a2, 0x5A
    st a2, 0(a1)
    /* prepare tagged address */
    slli a2, a2, 56
    or a2, a2, a1
    /* load data with tagged address */
    ld a3, 0(a2)
    /* compare with reference data */
    li a4, 0x12345678
    bne a3, a3, fail

success:
    li a0, 0
    /* writing to 0x8c3 csr makes qemu to exit */
    csrw 0x8c3, a0

fail:
    li a0, 1
    /* writing to 0x8c3 csr makes qemu to exit */
    csrw 0x8c3, a0

.align 8
test_data:
.byte 0x12345678
