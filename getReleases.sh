#!/bin/bash

source ./badge.sh

putBadge() {
  ID=$1
  NAME=$2
  VALUE=$3
  badge_value $ID $NAME $VALUE
  badge_vcol $ID black   
}

get_latest_release() {
  curl --silent $1 |
    grep '"tag_name":' |                                            
    sed -E 's/.*"([^"]+)".*/\1/'                                   
}

VELEROURL="https://api.github.com/repos/vmware-tanzu/velero/releases"
GITURL="https://api.github.com/repos/git/git/releases"
AZCLIURL="https://api.github.com/repos/Azure/azure-cli/releases"
TERRAFORMURL="https://api.github.com/repos/hashicorp/terraform/releases"
TFLINTURL="https://api.github.com/repos/terraform-linters/tflint/releases"
KUBECTLURL="https://api.github.com/repos/kubernetes/kubernetes/releases"
HELMURL="https://api.github.com/repos/helm/helm/releases"
ISTIOURL="https://api.github.com/repos/istio/istio/releases"
AZURERMURL="https://api.github.com/repos/terraform-providers/terraform-provider-azurerm/releases"
CERTMANAGERURL="https://api.github.com/repos/jetstack/cert-manager/releases"
PODIDURL="https://api.github.com/repos/Azure/aad-pod-identity/releases"
METRICSURL="https://api.github.com/repos/kubernetes/kube-state-metrics/releases"
GATEKEEPERURL="https://api.github.com/repos/open-policy-agent/gatekeeper/releases"
KUREDURL="https://api.github.com/repos/weaveworks/kured/releases"

putBadge velero-release velero $(get_latest_release VELEROURL)  
putBadge git-release git $(get_latest_release GITURL)
putBadge azcli-release azcli $(get_latest_release AZCLIURL)
putBadge terraform-release terraform $(get_latest_release TERRAFORMURL)
putBadge tflint-release tflint $(get_latest_release TFLINTURL)
putBadge kubectl-release kubectl $(get_latest_release KUBECTLURL)
putBadge helm-release helm $(get_latest_release HELMURL)
putBadge istio-release istio $(get_latest_release ISTIOURL)
putBadge azurerm-release azurerm $(get_latest_release AZURERMURL)
putBadge certmanager-release certmanager $(get_latest_release CERTMANAGERURL)
putBadge podid-release podid $(get_latest_release PODIDURL)
putBadge metrics-release metrics $(get_latest_release METRICSURL)
putBadge gatekeeper-release gatekeeper $(get_latest_release GATEKEEPERURL)
putBadge kured-release kured $(get_latest_release KUREDURL)

ALPINE=$(curl -s https://wiki.alpinelinux.org/wiki/Alpine_Linux:Releases | grep -o -E 'The latest release of Alpine Linux is:.{0,20}' | cut -d \b -f 2 | head -1 | cut -c 2- | head --bytes -3)
AKS0=$(curl -s https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions | grep -o -E '<td>.{0,20}' | tail -15 | cut -d \< -f 2 | cut -c 4- | head -1)
AKS0AB=$(curl -s https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions | grep -o -E '<td>.{0,20}' | tail -12 | cut -d \< -f 2 | cut -c 4- | head -1 | sed "s/ //g")
AKS1=$(curl -s https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions | grep -o -E '<td>.{0,20}' | tail -10 | cut -d \< -f 2 | cut -c 4- | head -1)
AKS1AB=$(curl -s https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions | grep -o -E '<td>.{0,20}' | tail -7 | cut -d \< -f 2 | cut -c 4- | head -1 | sed "s/ //g")
AKS2=$(curl -s https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions | grep -o -E '<td>.{0,20}' | tail -5 | cut -d \< -f 2 | cut -c 4- | head -1)
AKS2AB=$(curl -s https://docs.microsoft.com/en-us/azure/aks/supported-kubernetes-versions | grep -o -E '<td>.{0,20}' | tail -2 | cut -d \< -f 2 | cut -c 4- | head -1 | sed "s/ //g")

putBadge alpine-release alpine $ALPINE
putBadge aks0-release aks "${AKS0}_from_${AKS0AB}"
putBadge aks1-release aks "${AKS1}_from_${AKS1AB}"
putBadge aks2-release aks "${AKS2}_from_${AKS2AB}" 

