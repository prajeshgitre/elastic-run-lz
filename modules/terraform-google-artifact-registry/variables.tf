/**
 * Copyright 2021 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

variable "iam" {
  description = "IAM bindings in {ROLE => [MEMBERS]} format."
  type        = map(list(string))
  default     = {}
}

variable "location" {
  description = "Registry location. Use `gcloud beta artifacts locations list' to get valid values"
  type        = string
  default     = ""
}

variable "project_id" {
  description = "Registry project id."
  type        = string
}

variable "labels" {
  description = "Labels to be attached to the registry."
  type        = map(string)
  default     = {}
}

variable "format" {
  description = "Repository format. One of DOCKER or UNSPECIFIED"
  type        = string
  default     = "DOCKER"
}

variable "description" {
  description = "An optional description for the repository"
  type        = string
  default     = "Terraform-managed registry"
}

variable "id" {
  description = "Repository id"
  type        = string
}

variable "iam_additive" {
  description = "IAM additive bindings in {ROLE => [MEMBERS]} format.	"
  type        = map(list(string))
  default     = {}
}