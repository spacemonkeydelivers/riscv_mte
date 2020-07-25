#!/bin/bash

source scripts/env.sh

CFLAGS="-O0 -nostdlib -T ${ROOT_DIR}/scripts/qemu.ld"

function build_tests ()
{
    PATH=$PATH:${INSTALL_DIR}/bin
    set -e
    mkdir -p "${TESTS_BUILD_DIR}"

    cd "${TESTS_BUILD_DIR}"
    for test in $(ls ${TESTS_SRC_DIR})
    do
        testbin=$(echo ${test} | sed 's/\..*//g')
        riscv64-unknown-elf-gcc ${TESTS_SRC_DIR}/${test} ${CFLAGS} -o ${testbin}
    done
}

