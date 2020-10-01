#!/bin/bash

cat velero.txt | grep -o -E '/vmware-tanzu/velero/releases/tag/.{0,6}' | cut -c 35- | head -1
