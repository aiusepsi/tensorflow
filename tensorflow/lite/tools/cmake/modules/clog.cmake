#
# Copyright 2021 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if(TARGET clog OR clog_POPULATED)
  return()
endif()

include(OverridableFetchContent)

OverridableFetchContent_Declare(
  clog
  GIT_REPOSITORY https://github.com/aiusepsi/cpuinfo
  # Sync with tensorflow/third_party/clog/workspace.bzl
  GIT_TAG f0418e5fc34c0f3526fc5c6758231433e108d2cf
  GIT_PROGRESS TRUE
  SOURCE_DIR "${CMAKE_BINARY_DIR}/clog"
)
OverridableFetchContent_GetProperties(clog)
if(NOT clog_POPULATED)
  OverridableFetchContent_Populate(clog)
endif()

set(CLOG_SOURCE_DIR "${clog_SOURCE_DIR}" CACHE PATH "CLOG source directory")
set(CLOG_BUILD_TESTS OFF CACHE BOOL "Disable CLOG tests")

add_subdirectory(
  "${clog_SOURCE_DIR}/deps/clog"
  "${clog_BINARY_DIR}"
  EXCLUDE_FROM_ALL
)
