SECTIONS
{
    .test 0x80000000 : AT(0x80000000) {
        *(.text);
    }
}
