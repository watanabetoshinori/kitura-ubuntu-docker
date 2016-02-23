#!/bin/bash

##
# Copyright IBM Corporation 2016
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
##

# This script clones and builds the Kitura sample app (using build_kitura.sh).
# It also builds and runs the test cases for Kitura sample app (using test_kitura.sh).

# If any commands fail, we want the shell script to exit immediately.
set -e

export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Clone and build Kitura
./build_kitura.sh

# Run test cases for Kitura
./test_kitura.sh
