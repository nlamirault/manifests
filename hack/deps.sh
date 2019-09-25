#!/bin/bash

# Copyright (C) 2016, 2019 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP="manifests"

KUBECTL_VERSION="1.13.0"

KUSTOMIZE_VERSION="3.2.0"
KUSTOMIZE_LINUX_FILE="kustomize_${KUSTOMIZE_VERSION}_linux_amd64"
KUSTOMIZE_LINUX_SHA256SUM="7db89e32575d81393d5d84f0dc6cbe444457e61ce71af06c6e6b7b6718299c22"
KUSTOMIZE_DARWIN_FILE=""
KUSTOMIZE_DARWIN_SHA256SUM="c7991a79470a52a95f1fac33f588b76f64e597ac64b54106e452f3a8f642c62e"

KUBEVAL_VERSION="0.14.0"
KUBEVAL_LINUX_FILE="kubeval-linux-amd64.tar.gz"
KUBEVAL_LINUX_SHA256SUM="8b1b8c63df9ee3206113a3352e07474ea071610cfacf40a64db74c56e163f1e2"
KUBEVAL_DARWIN_FILE="kubeval-darwin-amd64.tar.gz"
KUBEVAL_DARWIN_SHA256SUM="05b9993e59a32b95bc5496dd98598e4a425643151efd108c0449405dd4a2a4c7"

CONFTEST_VERSION="0.11.0"
CONFTEST_LINUX_FILE="conftest_${CONFTEST_VERSION}_Linux_x86_64.tar.gz"
CONFTEST_LINUX_SHA256SUM="935ce17d12041af23d0fa98135ddc56c32108ef7e522bb608c62bddbf8611881"
CONFTEST_DARWIN_FILE="conftest_${CONFTEST_VERSION}_Darwin_x86_64.tar.gz"
CONFTEST_DARWIN_SHA256SUM="25564d5ecdbb8e9aaf7432a02e04668de2a81e76710298c2a41e3a79ade0509e"

POPEYE_VERSION="0.4.3"
POPEYE_LINUX_FILE="popeye_${POPEYE_VERSION}_Linux_x86_64.tar.gz"
POPEYE_LINUX_SHA256SUM="074094a87d6be54e959bb029fed27c899e79e9d6a6a4e18860a0e5ab3c2f3c7b"
POPEYE_DARWIN_FILE="popeye_${POPEYE_VERSION}_Darwin_x86_64.tar.gz"
POPEYE_DARWIN_SHA256SUM="cb05cdecedf38117fe8f64519812d5231f1c1c87f900c8877f418cf21cdef477"

NO_COLOR="\033[0m"
DEBUG_COLOR="\e[34m"
INFO_COLOR="\e[32m"
ERROR_COLOR="\e[31m"
WARN_COLOR="\e[35m"


function install_kubectl() {
    echo -e "${INFO_COLOR}[${APP}] Download kubectl${NO_COLOR}"
    OS_FILE=$1

    wget --quiet https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/${OS_FILE}/kubectl \
        && mv kubectl ${HOME}/bin/kubectl \
        && chmod +x ${HOME}/bin/kubectl
}


function install_kustomize() {
    FILE=$1
    SHA256SUM=$2

    # Install kustomize
    echo -e "${INFO_COLOR}[${APP}] Download Kustomize${NO_COLOR}"
    wget --quiet https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/${FILE} \
        && echo "${SHA256SUM}  ${FILE}" > checksums.txt \
        && sha256sum -c checksums.txt \
        && mv ${FILE} ${HOME}/bin/kustomize \
        && chmod +x ${HOME}/bin/kustomize
}

function install_kubeval {
    FILE=$1
    SHA256SUM=$2

    # Install kubeval
    echo -e "${INFO_COLOR}[${APP}] Download Kubeval${NO_COLOR}"
    wget --quiet https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/${FILE} \
        && echo "${SHA256SUM}  ${FILE}" > checksums.txt \
        && sha256sum -c checksums.txt \
        && tar zxf ${FILE} \
        && mv kubeval ${HOME}/bin/kubeval \
        && chmod +x ${HOME}/bin/kubeval \
        && rm ${FILE}
}

function install_conftest() {
    FILE=$1
    SHA256SUM=$2

    # Install conftest
    echo -e "${INFO_COLOR}[${APP}] Download Conftest${NO_COLOR}"
    wget --quiet https://github.com/instrumenta/conftest/releases/download/v${CONFTEST_VERSION}/${FILE} \
        && echo "${SHA256SUM}  ${FILE}" > checksums.txt \
        && sha256sum -c checksums.txt \
        && tar zxf ${FILE} \
        && mv conftest ${HOME}/bin/conftest \
        && chmod +x ${HOME}/bin/conftest \
        && rm ${FILE}
}

function install_popeye() {
    FILE=$1
    SHA256SUM=$2

    # Install popeye
    echo -e "${INFO_COLOR}[${APP}] Download Popeye${NO_COLOR}"
    wget --quiet https://github.com/derailed/popeye/releases/download/v${POPEYE_VERSION}/${FILE} \
        && echo  "${SHA256SUM}  ${FILE}" > checksums.txt \
        && sha256sum -c checksums.txt \
        && tar zxf ${FILE} \
        && mv popeye ${HOME}/bin/popeye \
        && chmod +x ${HOME}/bin/popeye \
        && rm ${FILE}
}


OS="`uname`"
case ${OS} in
  'Linux')
    OS='Linux'
    echo -e "${INFO_COLOR}[${APP}] OS: ${OS}${NO_COLOR}"
    install_kubectl "linux/amd64"
    install_kustomize ${KUSTOMIZE_LINUX_FILE} ${KUSTOMIZE_LINUX_SHA256SUM}
    install_kubeval ${KUBEVAL_LINUX_FILE} ${KUBEVAL_LINUX_SHA256SUM}
    install_conftest ${CONFTEST_LINUX_FILE} ${CONFTEST_LINUX_SHA256SUM}
    install_popeye ${POPEYE_LINUX_FILE} ${POPEYE_LINUX_SHA256SUM}
    ;;
  'Darwin')
    OS='Mac'
    echo -e "${INFO_COLOR}[${APP}] OS: ${OS}${NO_COLOR}"
    install_kubectl "darwin/amd64"
    install_kustomize ${KUSTOMIZE_DARWIN_FILE} ${KUSTOMIZE_DARWIN_SHA256SUM}
    install_kubeval ${KUBEVAL_DARWIN_FILE} ${KUBEVAL_DARWIN_SHA256SUM}
    install_conftest ${CONFTEST_DARWIN_FILE} ${CONFTEST_DARWIN_SHA256SUM}
    install_popeye ${POPEYE_DARWIN_FILE} ${POPEYE_DARWIN_SHA256SUM}
    ;;
  *)
    echo -e "${ERROR_COLOR}[${APP}] OS: ${OS} is not supported${NO_COLOR}"
    exit 1
    ;;
esac


# # Install kustomize
#     echo -e "${INFO_COLOR}[${APP}] Download Kustomize${NO_COLOR}"
#     wget --quiet https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/${KUSTOMIZE_LINUX_FILE} \
#         && echo "${KUSTOMIZE_LINUX_SHA256SUM}  ${KUSTOMIZE_LINUX_FILE}" > checksums.txt \
#         && sha256sum -c checksums.txt \
#         && mv ${KUSTOMIZE_LINUX_FILE} ${HOME}/bin/kustomize \
#         && chmod +x ${HOME}/bin/kustomize

#     # Install kubeval
#     echo -e "${INFO_COLOR}[${APP}] Download Kubeval${NO_COLOR}"
#     wget --quiet https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/${KUBEVAL_LINUX_FILE} \
#         && echo "${KUBEVAL_LINUX_SHA256SUM}  ${KUBEVAL_LINUX_FILE}" > checksums.txt \
#         && sha256sum -c checksums.txt \
#         && tar zxf ${KUBEVAL_LINUX_FILE} \
#         && mv kubeval ${HOME}/bin/kubeval \
#         && chmod +x ${HOME}/bin/kubeval \
#         && rm ${KUBEVAL_LINUX_FILE}

#     # Install conftest
#     echo -e "${INFO_COLOR}[${APP}] Download Conftest${NO_COLOR}"
#     wget --quiet https://github.com/instrumenta/conftest/releases/download/v${CONFTEST_VERSION}/${CONFTEST_LINUX_FILE} \
#         && echo "${CONFTEST_LINUX_SHA256SUM}  ${CONFTEST_LINUX_FILE}" > checksums.txt \
#         && sha256sum -c checksums.txt \
#         && tar zxf ${CONFTEST_LINUX_FILE} \
#         && mv conftest ${HOME}/bin/conftest \
#         && chmod +x ${HOME}/bin/conftest \
#         && rm ${CONFTEST_LINUX_FILE}

#     # Install popeye
#     echo -e "${INFO_COLOR}[${APP}] Download Popeye${NO_COLOR}"
#     wget --quiet https://github.com/derailed/popeye/releases/download/v${POPEYE_VERSION}/${POPEYE_LINUX_FILE} \
#         && echo  "${POPEYE_LINUX_SHA256SUM}  ${POPEYE_LINUX_FILE}" > checksums.txt \
#         && sha256sum -c checksums.txt \
#         && tar zxf ${POPEYE_LINUX_FILE} \
#         && mv popeye ${HOME}/bin/popeye \
#         && chmod +x ${HOME}/bin/popeye \
#         && rm ${POPEYE_LINUX_FILE}