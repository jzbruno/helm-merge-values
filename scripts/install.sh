#!/usr/bin/env bash

version="0.5.0"
os="$(uname)"

mkdir -p ${HELM_PLUGIN_DIR}/bin/

if [[ "${os}" == "Darwin" ]]; then
    wget -q https://github.com/jzbruno/helm-merge-values/releases/download/${version}/helm-merge-values-darwin-amd64 -O ${HELM_PLUGIN_DIR}/bin/helm-merge-values
elif [[ "${os}" == "Linux" ]]; then
    wget -q https://github.com/jzbruno/helm-merge-values/releases/download/${version}/helm-merge-values-linux-amd64 -O ${HELM_PLUGIN_DIR}/bin/helm-merge-values
else
  echo "Install using 'helm plugin install' only supports Mac and Linux with amd64 architecture. Other binaries are compiled and can be found at https://github.com/jzbruno/helm-merge-values/releases/latest"
fi

chmod +x ${HELM_PLUGIN_DIR}/bin/helm-merge-values
