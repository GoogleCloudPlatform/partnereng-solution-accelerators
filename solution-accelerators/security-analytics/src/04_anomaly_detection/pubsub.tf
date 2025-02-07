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
module "pubsub" {
  source       = "terraform-google-modules/pubsub/google"
  version      = "~> 5.0"
  for_each     = toset(var.topics)
  project_id   = data.google_project.project.project_id
  topic        = "${each.value}-${local.random_suffix}"
  topic_labels = local.labels_map
}
