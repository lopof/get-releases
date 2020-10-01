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
curl -m 5 -s https://github.com/helm/helm/releases > helm.txt
curl -m 5 -s https://github.com/istio/istio/releases > istio.txt
curl -m 5 -s https://github.com/terraform-providers/terraform-provider-azurerm/releases > azurerm.txt
curl -m 5 -s https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions > aks.txt
curl -m 5 -s https://github.com/jetstack/cert-manager/releases > certmanager.txt
curl -m 5 -s https://github.com/Azure/aad-pod-identity/releases > podid.txt
curl -m 5 -s https://github.com/kubernetes/kube-state-metrics/releases > metrics.txt
curl -m 5 -s https://github.com/open-policy-agent/gatekeeper/releases > gatekeeper.txt
curl -m 5 -s https://github.com/weaveworks/kured/releases > kured.txt

ALPINE=$(cat alpine.txt | grep -o -E 'The latest release of Alpine Linux is:.{0,20}' | cut -d \b -f 2 | head -1 | cut -c 2- | head --bytes -3)
VELERO=$(cat velero.txt | grep -o -E '"/vmware-tanzu/velero/releases/tag/.{0,20}' | cut -d \" -f 2 | cut -c 35- | head -1)
GIT=$(cat git.txt | grep -o -E '"/git/git/releases/tag/.{0,20}' | cut -d \" -f 2 | cut -c 23- | head -1)
AZCLI=$(cat azcli.txt | grep -o -E '"/Azure/azure-cli/tree/azure-cli.{0,20}' | cut -d \" -f 2 | cut -c 33- | head -1)
TERRAFORM=$(cat terraform.txt | grep -o -E '"/hashicorp/terraform/tree/.{0,20}' | cut -d \" -f 2 | cut -c 27- | head -1)
TFLINT=$(cat tflint.txt | grep -o -E '"/terraform-linters/tflint/tree/.{0,20}' | cut -d \" -f 2 | cut -c 32- | head -1)
KUBECTL=$(cat kubectl.txt | grep -o -E '"/kubernetes/kubernetes/tree/.{0,20}' | cut -d \" -f 2 | head -1 | cut -c 29-)
HELM=$(cat helm.txt | grep -o -E '"/helm/helm/tree/.{0,20}' | cut -d \" -f 2 | head -1 | cut -c 17-)
ISTIO=$(cat istio.txt | grep -o -E '"/istio/istio/tree/.{0,20}' | cut -d \" -f 2 | head -1 | cut -c 19-)
AZURERM=$(cat azurerm.txt | grep -o -E '"/terraform-providers/terraform-provider-azurerm/tree/.{0,20}' | cut -d \" -f 2 | head -1 | cut -c 54-)

AKS0=$(cat aks.txt | grep -o -E '<td>.{0,20}' | tail -15 | cut -d \< -f 2 | cut -c 4- | head -1)
AKS0AB=$(cat aks.txt | grep -o -E '<td>.{0,20}' | tail -12 | cut -d \< -f 2 | cut -c 4- | head -1 | sed "s/ //g")
AKS1=$(cat aks.txt | grep -o -E '<td>.{0,20}' | tail -10 | cut -d \< -f 2 | cut -c 4- | head -1)
AKS1AB=$(cat aks.txt | grep -o -E '<td>.{0,20}' | tail -7 | cut -d \< -f 2 | cut -c 4- | head -1 | sed "s/ //g")
AKS2=$(cat aks.txt | grep -o -E '<td>.{0,20}' | tail -5 | cut -d \< -f 2 | cut -c 4- | head -1)
AKS2AB=$(cat aks.txt | grep -o -E '<td>.{0,20}' | tail -2 | cut -d \< -f 2 | cut -c 4- | head -1 | sed "s/ //g")

CERTMANAGER=$(cat certmanager.txt | grep -o -E '"/jetstack/cert-manager/tree.{0,20}' | cut -d \" -f 2 | cut -c 29- | head -1)
PODID=$(cat podid.txt | grep -o -E '"/Azure/aad-pod-identity/tree.{0,20}' | cut -d \" -f 2 | cut -c 30- | head -1)
METRICS=$(cat metrics.txt | grep -o -E '"/kubernetes/kube-state-metrics/tree.{0,20}' | cut -d \" -f 2 | cut -c 37- | head -1)
GATEKEEPER=$(cat gatekeeper.txt | grep -o -E '"/open-policy-agent/gatekeeper/tree.{0,20}' | cut -d \" -f 2 | cut -c 36- | head -1)
KURED=$(cat kured.txt | grep -o -E '"/weaveworks/kured/tree.{0,20}' | cut -d \" -f 2 | cut -c 24- | head -1)

putBadge velero-release velero $VELERO
putBadge alpine-release alpine $ALPINE
putBadge git-release git $GIT
putBadge azcli-release azcli $AZCLI
putBadge terraform-release terraform $TERRAFORM
putBadge tflint-release tflint $TFLINT
putBadge kubectl-release kubectl $KUBECTL
putBadge helm-release helm $HELM
putBadge istio-release istio $ISTIO
putBadge azurerm-release azurerm $AZURERM
putBadge aks0-release aks "${AKS0}_ab_${AKS0AB}"
putBadge aks1-release aks "${AKS1}_ab_${AKS1AB}"
putBadge aks2-release aks "${AKS2}_ab_${AKS2AB}" 
putBadge certmanager-release certmanager $CERTMANAGER
putBadge podid-release podid $PODID
putBadge metrics-release metrics $METRICS
putBadge gatekeeper-release gatekeeper $GATEKEEPER
putBadge kured-release kured $KURED

rm kured.txt
rm gatekeeper.txt
rm metrics.txt
rm podid.txt
rm certmanager.txt
rm aks.txt
rm azurerm.txt
rm istio.txt
rm helm.txt
rm kubectl.txt
rm tflint.txt
rm terraform.txt
rm azcli.txt
rm git.txt
rm alpine.txt
rm velero.txt
