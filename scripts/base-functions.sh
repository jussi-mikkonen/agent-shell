#   Copyright 2016 Aino.io
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.

red() {
    if [ "`which tput`" != "" ]; then
        tput setaf 1
    fi

}
green() {
    if [ "`which tput`" != "" ]; then
        tput setaf 2
    fi

}
normal() {
   if [ "`which tput`" != "" ]; then
        tput sgr0
   fi

}