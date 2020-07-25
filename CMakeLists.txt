project(qemu_pm_tests)
cmake_minimum_required(VERSION 2.8)


enable_testing()
add_test(simple_pass ${CMAKE_CURRENT_SOURCE_DIR}/scripts/run_qemu.sh ${CMAKE_CURRENT_SOURCE_DIR}/build/tests/simple_pass ${CMAKE_CURRENT_SOURCE_DIR})

add_test(simple_fail ${CMAKE_CURRENT_SOURCE_DIR}/scripts/run_qemu.sh ${CMAKE_CURRENT_SOURCE_DIR}/build/tests/simple_fail ${CMAKE_CURRENT_SOURCE_DIR})
set_tests_properties(simple_fail PROPERTIES WILL_FAIL TRUE)

add_test(testcase_1a ${CMAKE_CURRENT_SOURCE_DIR}/scripts/run_qemu.sh ${CMAKE_CURRENT_SOURCE_DIR}/build/tests/testcase_1a ${CMAKE_CURRENT_SOURCE_DIR})
