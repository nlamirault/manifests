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

APP = manifests

KUBE_VERSION = 1.12.8

SHELL = /bin/bash -o pipefail

DIR = $(shell pwd)

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m
INFO_COLOR=\033[34;01m

MAKE_COLOR=\033[33;01m%-20s\033[0m

.DEFAULT_GOAL := help

OK=[✅]
KO=[❌]
WARN=[⚠️]

.PHONY: help
help:
	@echo -e "$(OK_COLOR)==== $(APP) ====$(NO_COLOR)"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "$(MAKE_COLOR) : %s\n", $$1, $$2}'

guard-%:
	@if [ "${${*}}" = "" ]; then \
		echo -e "$(ERROR_COLOR)Environment variable $* not set$(NO_COLOR)"; \
		exit 1; \
	fi

check-%:
	@if $$(hash $* 2> /dev/null); then \
		echo -e "$(OK_COLOR)$(OK)$(NO_COLOR) $*"; \
	else \
		echo -e "$(ERROR_COLOR)$(KO)$(NO_COLOR) $*"; \
	fi

.PHONY: check
check: check-kubectl check-kustomize check-conftest check-kubeval ## Check requirements


# ====================================
# K U B E R N E T E S
# ====================================


.PHONY: kubernetes-deps
kubernetes-deps: ## Retrieve Kubernetes dependencies
	@./hack/deps.sh

.PHONY: kubernetes-validate
kubernetes-validate: guard-SERVICE ## Validate Kubernetes manifests on Kustomization (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Validate kustomization ${SERVICE}$(NO_COLOR)"
	@kustomize build $(SERVICE)/base | kubeval -o tap -v $(KUBE_VERSION) --ignore-missing-schemas

.PHONY: kubernetes-policy
kubernetes-policy: guard-SERVICE ## Check policies on Kustomization (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Policy kustomization ${SERVICE}$(NO_COLOR)"
	@kustomize build $(SERVICE)/base | conftest test -o tap -p policy -

.PHONY: kubernetes-build
kubernetes-build: guard-SERVICE ## Build Kustomization (SERVICE=xxx)
	@echo -e "$(OK_COLOR)[$(APP)] Build kustomization ${SERVICE}$(NO_COLOR)"
	@kustomize build $(SERVICE)/overlays/staging
