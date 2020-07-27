#!/bin/bash

ROOT_DIR="$(pwd)"

source scripts/env.sh

git submodule update --init --recursive

# switch QEMU to proper branch
cd ${QEMU_SRC_DIR}
git checkout riscv_mte-devel
git submodule update
cd ${ROOT_DIR}

cd ${GCC_SRC_DIR}/riscv-binutils/
git checkout riscv_mte-dev
cd ${ROOT_DIR}

cd ${LLVM_SRC_DIR}
git checkout llvm10_mte
cd ${ROOT_DIR}
