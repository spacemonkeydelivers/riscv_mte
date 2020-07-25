#!/bin/bash

source scripts/env.sh

function build_gcc ()
{
    mkdir -p "${GCC_BUILD_DIR}"

    cd "${GCC_BUILD_DIR}"
    ${GCC_SRC_DIR}/configure --prefix="${INSTALL_DIR}" --with-arch=${RISCV_ISA_TARGET}
    set -e
    make newlib -j${CPU_NUM}
}

