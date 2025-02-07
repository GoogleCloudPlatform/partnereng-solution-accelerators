/*
 Copyright 2023 Google LLC

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

terraform {
  required_version = ">= 1.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.58.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "4.57.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
  }
}

provider "google-beta" {
  project = data.terraform_remote_state.bootstrap.outputs.project_id
  region  = data.terraform_remote_state.bootstrap.outputs.region
  zone    = data.terraform_remote_state.bootstrap.outputs.zone
}

provider "google" {
  project = data.terraform_remote_state.bootstrap.outputs.project_id
  region  = data.terraform_remote_state.bootstrap.outputs.region
  zone    = data.terraform_remote_state.bootstrap.outputs.zone
}
