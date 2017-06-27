#!/bin/sh


Copyright 2017 Gunter Miegel mailto:gunter.miegel@rgsqd.de

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

ACTION=$1
IP=$2
MAC=$3
HOSTNAME=$3
# use "lpstat -d -p" to get a list of printers
#PRINTER=HP-LaserJet-500-color-M551
# Output of this PDF printer is at /root/PDF
PRINTER=Generic-CUPS-PDF-Printer

if [ $ACTION = 'add' ]; then
  wall "New Machine: IP=$IP MAC=$MAC"
  echo "IP=$IP MAC=$MAC" | lpr -P $PRINTER
elif [ $ACTION = 'del' ]; then
  wall "Removed Machine: IP=$IP MAC=$MAC"
elif [ $ACTION = 'old' ]; then
  wall "Existing Machine: IP=$IP MAC=$MAC"
else
  echo "Failure, something went wrong, input was: $@"
fi

