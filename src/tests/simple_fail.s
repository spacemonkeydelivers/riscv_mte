.global main

.text
.balign 8
main:
    li a0, 1
    /* writing to 0x8c3 csr makes qemu to exit */
    csrw 0x8c3, a0
