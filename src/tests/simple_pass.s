.global main

.text
.balign 8
main:
    li a0, 0
    /* writing to 0x8c3 csr makes qemu to exit */
    csrw 0x8c3, a0
