#!/bin/bash
#
# efax4asterisk AGI script - http://code.google.com/p/efax4asterisk/
# Copyright [2010] Michael J. Mavroudis (michael.j.mavroudis@gmail.com)
# Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
#
if [ -n "${1}" ]; then
  FN="/path/to/directory/${1//[^0-9\-]/}"
  /usr/bin/tiff2pdf -o $FN.pdf $FN.tiff
  /bin/rm -f $FN.tiff
  /bin/echo "You've received a fax:" > $FN.txt
  /bin/echo "" >> $FN.txt
  /bin/echo "CallerID Number: ${2}" >> $FN.txt
  /bin/echo "CallerID Name: ${3}" >> $FN.txt
  /bin/echo "Remote StationID: ${4}" >> $FN.txt
  /bin/echo "Pages: ${5}" >> $FN.txt
  /bin/echo "Rate: ${6}" >> $FN.txt
  /bin/echo "Resolution: ${7}" >> $FN.txt
  /bin/echo "Status: ${8}" >> $FN.txt
  /bin/echo "Status Details: ${9}" >> $FN.txt
  /bin/echo "Error Message: ${10}" >> $FN.txt
  /bin/echo "" >> $FN.txt
  /bin/echo "Open the attached pdf document to view the fax: ${1}.pdf" >> $FN.txt
  if [ -n "${11}" ]; then
    /usr/bin/mutt -s "[FAX]: ${2} - ${5} Page(s)" -a $FN.pdf ${11//[^0-9a-zA-Z@_\-\.]/} < $FN.txt
  fi
fi
exit 0;