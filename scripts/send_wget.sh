#!/bin/sh
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

if [ -e "${AINO_HOME}/base-functions.sh" ]; then
    . "${AINO_HOME}/base-functions.sh"
fi
	if [ "`which wget`" = "" ]; then
		echo "Wget not found."
		exit 1
	fi
	OUT=/dev/null
	AINO_URL="$3"
	AINO_API_KEY="$4"

	if [ "$AINO_HTTP_OUT" != "" ]; then
	    OUT=$AINO_HTTP_OUT
	fi
    OUTPUT="`wget -nv --server-response --header=\"Authorization: apikey ${AINO_API_KEY}\" --header=\"Content-type: application/json\" ${AINO_URL} --post-data \"$2\" -O - 2>&1`"
	if [ "${VERBOSE_AINO}" = "true" ]; then
	    echo "Command: wget -nv --server-response --header=\"Authorization: apikey ${AINO_API_KEY}\" --header=\"Content-type: application/json\" ${AINO_URL} --post-data \"payload\" -O - 2>&1"
    	echo "$OUTPUT"
    fi
    echo "$OUTPUT" > $OUT

    STATUSCODE="`echo \"$OUTPUT\"|head -n1|cut -d' ' -f4`"
    ERROR="`echo \"$OUTPUT\"|tail -n1`"

	if [ "$STATUSCODE" != "200" -a "$STATUSCODE" != "202" ]; then
        red
	    echo "Error: Failed to send message to aino: $STATUSCODE $ERROR"
	    normal
    fi

