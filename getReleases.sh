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
GITURL="https://api.github.com/repos/git/git/releases/latest"
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

putBadge velero-release velero $(get_latest_release $VELEROURL)  
putBadge git-release git $(get_latest_release $GITURL)
putBadge azcli-release azcli $(get_latest_release $AZCLIURL)
putBadge terraform-release terraform $(get_latest_release $TERRAFORMURL)
putBadge tflint-release tflint $(get_latest_release $TFLINTURL)
putBadge kubectl-release kubectl $(get_latest_release $KUBECTLURL)
putBadge helm-release helm $(get_latest_release $HELMURL)
putBadge istio-release istio $(get_latest_release $ISTIOURL)
putBadge azurerm-release azurerm $(get_latest_release $AZURERMURL)
putBadge certmanager-release certmanager $(get_latest_release $CERTMANAGERURL)
putBadge podid-release podid $(get_latest_release $PODIDURL)
putBadge metrics-release metrics $(get_latest_release $METRICSURL)
putBadge gatekeeper-release gatekeeper $(get_latest_release $GATEKEEPERURL)
putBadge kured-release kured $(get_latest_release $KUREDURL)

ALPINE=$(curl -s https://wiki.alpinelinux.org/wiki/Alpine_Linux:Releases | grep -o -E 'The latest release of Alpine Linux is:.{0,20}' | cut -d \b -f 2 | head -1 | cut -c 2- | head --bytes -3)
AKSVER=$(az aks get-versions --location westeurope --output json | grep -A 2 '"isPreview": null' | tail -1 | sed -E 's/.*"([^"]+)".*/\1/')

putBadge alpine-release alpine $ALPINE
putBadge aks-release aks $AKSVER
