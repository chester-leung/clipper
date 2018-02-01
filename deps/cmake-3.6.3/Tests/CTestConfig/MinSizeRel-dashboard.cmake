set(CMAKE_CONFIGURATION_TYPES "")
set(CTEST_SOURCE_DIRECTORY "/Users/Chester/Cal/2/clipper/deps/cmake-3.6.3/Tests/CTestConfig")
set(CTEST_BINARY_DIRECTORY "/Users/Chester/Cal/2/clipper/deps/cmake-3.6.3/Tests/CTestConfig/MinSizeRel-dashboard")

file(MAKE_DIRECTORY "${CTEST_BINARY_DIRECTORY}")

get_filename_component(dir "${CMAKE_COMMAND}" PATH)
set(CMAKE_CTEST_COMMAND "${dir}/ctest")

message("CMAKE_COMMAND='${CMAKE_COMMAND}'")
message("CMAKE_CTEST_COMMAND='${CMAKE_CTEST_COMMAND}'")

set(arg "")
if(NOT CMAKE_CONFIGURATION_TYPES)
  set(arg "-DCMAKE_BUILD_TYPE:STRING=MinSizeRel")
endif()

message("cmake initial configure")
execute_process(COMMAND ${CMAKE_COMMAND}
   ${arg}
   -G "Unix Makefiles"
   -A ""
   -T ""
   ${CTEST_SOURCE_DIRECTORY}
  WORKING_DIRECTORY ${CTEST_BINARY_DIRECTORY}
  RESULT_VARIABLE rv)
if(NOT rv STREQUAL 0)
  message(FATAL_ERROR "error calling cmake: rv='${rv}'")
endif()


function(call_ctest arg)
  message("call_ctest ${arg}")
  execute_process(COMMAND ${CMAKE_CTEST_COMMAND}
    -C "MinSizeRel" -D ${arg} -VV
    WORKING_DIRECTORY ${CTEST_BINARY_DIRECTORY}
    RESULT_VARIABLE rv)
  if(NOT rv STREQUAL 0)
    message(FATAL_ERROR "error calling ctest: rv='${rv}'")
  endif()
endfunction()


call_ctest(ExperimentalStart)
call_ctest(ExperimentalConfigure)
call_ctest(ExperimentalBuild)
call_ctest(ExperimentalTest)