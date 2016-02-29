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

# This script clones and builds the Kitura sample app.

# If any commands fail, we want the shell script to exit immediately.
set -e

# The Git branch to clone should be set as an environment variable.
# If branch environment var is not set, use master as the default value.
if [ -z "$KITURA_BRANCH" ]; then
  KITURA_BRANCH="master"
fi

echo ">> About to clone branch '$KITURA_BRANCH' for Kitura"
# Clone Kitura repo
cd /root && rm -rf Kitura && git clone -b $KITURA_BRANCH https://github.com/IBM-Swift/Kitura.git

# Build Kitura
echo ">> About to build Kitura..."
cd /root/Kitura && swift build -Xcc -fblocks
echo ">> Build for Kitura completed (see above for results)."
