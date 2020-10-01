#!/bin/bash

curl -m 5 -s https://github.com/vmware-tanzu/velero/releases/ > velero.txt

cat velero.txt | grep -o -E '/vmware-tanzu/velero/releases/tag/.{0,6}' | cut -c 35- | head -1

rm velero.txt
