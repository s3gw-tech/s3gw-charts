# Copyright © 2023 SUSE LLC
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

########################################################################
# Testing cluster

cluster-start:
	@./test-env/cluster-create.sh
	k3d kubeconfig merge -ad
	kubectl config use-context k3d-s3gw-charts-testing
	@./test-env/cluster-prepare.sh

cluster-delete:
	k3d cluster delete s3gw-charts-testing
	@if test -f /usr/local/bin/rke2-uninstall.sh; then sudo sh /usr/local/bin/rke2-uninstall.sh; fi

########################################################################
# Setup test environment

setup-test-environment:
	python3 -m venv venv \
	&& source venv/bin/activate \
	&& pip install -r requirements-dev.txt

########################################################################
# Test charts

lint-test-all:
	@./test-env/run-lint-test.sh
