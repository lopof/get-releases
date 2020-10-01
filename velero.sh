#!/bin/bash

source ./badge.sh

putBadge() {
  ID=$1
  NAME=$2
  VALUE=$3
  badge_value $ID $NAME $VALUE
  badge_vcol  $ID $teal
}

curl -m 5 -s https://github.com/vmware-tanzu/velero/releases/ > velero.txt
curl -m 5 -s https://wiki.alpinelinux.org/wiki/Alpine_Linux:Releases > alpine.txt
curl -m 5 -s https://github.com/git/git/releases > git.txt
curl -m 5 -s https://github.com/Azure/azure-cli/releases > azcli.txt
curl -m 5 -s https://github.com/hashicorp/terraform/releases > terraform.txt
curl -m 5 -s https://github.com/terraform-linters/tflint/releases > tflint.txt
curl -m 5 -s https://github.com/kubernetes/kubernetes/releases > kubectl.txt

ALPINE=$(cat alpine.txt | grep -o -E 'The latest release of Alpine Linux is:.{0,10}' | cut -c 43- | head -1)
VELERO=$(cat velero.txt | grep -o -E '"/vmware-tanzu/velero/releases/tag/.{0,20}' | cut -d \" -f 2 | cut -c 35- | head -1)
GIT=$(cat git.txt | grep -o -E '"/git/git/releases/tag/.{0,20}' | cut -d \" -f 2 | cut -c 23- | head -1)
AZCLI=$(cat azcli.txt | grep -o -E '"/Azure/azure-cli/tree/azure-cli.{0,20}' | cut -d \" -f 2 | cut -c 33- | head -1)
TERRAFORM=$(cat terraform.txt | grep -o -E '"/hashicorp/terraform/tree/.{0,20}' | cut -d \" -f 2 | cut -c 27- | head -1)
TFLINT=$(cat tflint.txt | grep -o -E '"/terraform-linters/tflint/tree/.{0,20}' | cut -d \" -f 2 | cut -c 32- | head -1)
KUBECTL=$(cat kubectl.txt | grep -o -E '"/kubernetes/kubernetes/tree/.{0,20}' | cut -d \" -f 2 | head -1 | cut -c 29-)

putBadge velero-release velero $VELERO
putBadge alpine-release alpine $ALPINE
putBadge git-release git $GIT
putBadge azcli-release azcli $AZCLI
putBadge terraform-release terraform $TERRAFORM
putBadge tflint-release tflint $TFLINT
putBadge kubectl-release kubectl $KUBECTL

rm kubectl.txt
rm tflint.txt
rm terraform.txt
rm azcli.txt
rm git.txt
rm alpine.txt
rm velero.txt
