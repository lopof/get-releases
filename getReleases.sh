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

VELEROURL="https://api.github.com/repos/vmware-tanzu/velero/releases/latest"
AZCLIURL="https://api.github.com/repos/Azure/azure-cli/releases/latest"
TERRAFORMURL="https://api.github.com/repos/hashicorp/terraform/releases/latest"
TFLINTURL="https://api.github.com/repos/terraform-linters/tflint/releases/latest"
KUBECTLURL="https://api.github.com/repos/kubernetes/kubernetes/releases/latest"
HELMURL="https://api.github.com/repos/helm/helm/releases/latest"
ISTIOURL="https://api.github.com/repos/istio/istio/releases/latest"
AZURERMURL="https://api.github.com/repos/terraform-providers/terraform-provider-azurerm/releases/latest"
CERTMANAGERURL="https://api.github.com/repos/jetstack/cert-manager/releases/latest"
PODIDURL="https://api.github.com/repos/Azure/aad-pod-identity/releases/latest"
METRICSURL="https://api.github.com/repos/kubernetes/kube-state-metrics/releases/latest"
GATEKEEPERURL="https://api.github.com/repos/open-policy-agent/gatekeeper/releases/latest"
KUREDURL="https://api.github.com/repos/weaveworks/kured/releases/latest"

VELERO=$(get_latest_release $VELEROURL)
AZCLI=$(get_latest_release $AZCLIURL)
TERRAFORM=$(get_latest_release $TERRAFORMURL)
TFLINT=$(get_latest_release $TFLINTURL)
KUBECTL=$(get_latest_release $KUBECTLURL)
HELM=$(get_latest_release $HELMURL)
ISTIO=$(get_latest_release $ISTIOURL)
AZURERM=$(get_latest_release $AZURERMURL)
CERTMANAGER=$(get_latest_release $CERTMANAGERURL)
PODID=$(get_latest_release $PODIDURL)
METRICS=$(get_latest_release $METRICSURL)
GATEKEEPER=$(get_latest_release $GATEKEEPERURL)
KURED=$(get_latest_release $KUREDURL)

putBadge velero-release velero $VELERO  
echo "velero:" $VELERO
putBadge azcli-release azcli $AZCli
echo "azcli:" $AZCLI
putBadge terraform-release terraform $TERRAFORM
echo "terraform:" $TERRAFORM
putBadge tflint-release tflint $TFLINT
echo "tflint:" $TFLINT
putBadge kubectl-release kubectl $KUBECTL
echo "kubectl:" $KUBECTL
putBadge helm-release helm $HELM
echo "helm:" $HELM
putBadge istio-release istio $ISTIO
echo "istio:" $ISTIO
putBadge azurerm-release azurerm $AZURERM
echo "azurerm:" $AZURERM
putBadge certmanager-release certmanager $CERTMANAGER
echo "certmanager:" $CERTMANAGER
putBadge podid-release podid $PODID
echo "podid:" $PODID
putBadge metrics-release metrics $METRICS
echo "metrics:" $METRICS
putBadge gatekeeper-release gatekeeper $GATEKEEPER
echo "gatekeeper:" $GATEKEEPER
putBadge kured-release kured $KURED
echo "kured:" $KURED

ALPINE=$(curl -s https://wiki.alpinelinux.org/wiki/Alpine_Linux:Releases | grep -o -E 'The latest release of Alpine Linux is:.{0,20}' | cut -d \b -f 2 | head -1 | cut -c 2- | head --bytes -3)
#AKSVER=$(az aks get-versions --location westeurope --output json | grep -A 2 '"isPreview": null' | tail -1 | sed -E 's/.*"([^"]+)".*/\1/')
GITVER=$(curl --silent https://api.github.com/repos/git/git/tags | grep '"name":' | sed -E 's/.*"([^"]+)".*/\1/' | grep -E '^.{7}$' | head -1)

putBadge alpine-release alpine $ALPINE
echo "alpine:" $ALPINE
putBadge git-release git $GITVER
echo "git:" $GITVER
#putBadge aks-release aks $AKSVER
