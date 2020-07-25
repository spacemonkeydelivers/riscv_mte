.global main

.text
.balign 8
main:
    li a0, 0xAB
    li a1, 0x80000000
    st a0, 0(a1)
    st a0, 4(a1)
    lt a2, 4(a1)
    bne a2, a0, fail

success:
    li a0, 0
    /* writing to 0x8c3 csr makes qemu to exit */
    csrw 0x8c3, a0

fail:
    li a0, 1
    /* writing to 0x8c3 csr makes qemu to exit */
    csrw 0x8c3, a0
