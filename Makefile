# Copyright Vadim Eisenberg 2017
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

UNAME = ${shell uname}

# set EXECUTABLE_DIRECTORY according to your specific environment
# run swift build and see where the output executable is created
ifeq ($(UNAME), Darwin)
EXECUTABLE_DIRECTORY = x86_64-apple-macosx10.10
else ifeq ($(UNAME), Linux)
EXECUTABLE_DIRECTORY = x86_64-unknown-linux
endif

TEST_DIRECTORY = ./.build/${EXECUTABLE_DIRECTORY}/debug/SwiftResourceHandlingExamplePackageTests.xctest/Contents/Resources

build: copyResources
	swift build

copyResources:
	cp Resources/* ./.build/${EXECUTABLE_DIRECTORY}/debug

run: build
	./.build/${EXECUTABLE_DIRECTORY}/debug/ResourceHandlingSample

test:
	mkdir -p ${TEST_DIRECTORY}
	cp Resources/* ${TEST_DIRECTORY}
	swift test

.PHONY: run build test
