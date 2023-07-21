# Copyright 2023 Bryon Baker

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

clean:
	podman rmi -f mlflow:latest
	podman rmi -f mlflow:latest quay.io/bryonbaker/mlflow:latest

build:
	podman build -t mlflow:latest .
	podman tag mlflow:latest quay.io/bryonbaker/mlflow:latest

push:
	podman push mlflow:latest quay.io/bryonbaker/mlflow:latest