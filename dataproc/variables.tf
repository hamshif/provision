/**
 * Copyright 2018 Google LLC
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

variable env {
  type        = "string"
  description = "environment"
}

variable project_id {
  type        = "string"
  description = "GCP project id"
}

variable app_name {
  type        = "string"
  description = "Name of application"
}

variable name {
  type        = "string"
  description = "Name of bucket"
}

variable region {
  type        = "string"
  description = "GCP region"
  default     = "us-west1"
}


variable zone {
  type        = "string"
  description = "GCP zone"
  default     = "us-west1-b"
}


variable subnetwork {
  type        = "string"
  description = "subnetwork"
  default     = "default"
}

variable host_suffix {
  type        = "string"
  description = "DNS host suffix/domain"
  default     = "gcp-np.wielder.org"
}

variable location_code {
  type        = "string"
  description = "A wielder code representing a single character for the type of physical location ('g' for Google cloud, 'm' for wielder datacenters) plus a short string indicating zone or location (e.x. gusw1, guse1, gase1, etc...). This will be used as the first segment of the machine's hostname"
}

variable cluster_id {
  type        = "string"
  description = "A four-digit, zero-padded number representing the pod number or cluster number for this component that will be used as the fifth segment of the machine's hostname. If unsure, use '0001'"
}

variable rack {
  type        = "string"
  description = "The rack designation (either 'a' or 'b') for this component that will be used as the sixth segment of the machine's hostname. If unsure, use 'a'"
}

variable high_availability {
  type        = "string"
  description = "dataproc high availability configuration (true or false)"
}

variable master_boot_disk_size {
  type        = "string"
  description = "dataproc master boot disk size in GB"
  default     = "10"
}

variable worker_boot_disk_size {
  type        = "string"
  description = "dataproc worker boot disk size in GB"
  default     = "10"
}

variable num_worker_nodes {
  type        = "string"
  description = "Number of worker nodes"
  default     = "3"
}

variable num_local_ssds {
  type        = "string"
  description = "number of local SSD on worker nodes"
  default     = "0"
}

variable num_preemptible_workers {
  type        = "string"
  description = "number of preemptible worker nodes"
  default     = "0"
}

variable master_machine_type {
  type        = "string"
  description = "machine type for dataproc master node(s)"
  default     = "n1-standard-1"
}

variable worker_machine_type {
  type        = "string"
  description = "machine type for dataproc worker nodes"
  default     = "n1-standard-4"
}

variable image_version {
  type        = "string"
  description = "dataproc image version"
  default     = ""
}

variable service_account {
  type        = "string"
  description = "service account for dataproc"
}

variable tags {
  type        = "list"
  description = "tags for dataproc nodes"
  default     = ["dataproc", "nat"]
}

variable extra_tags {
  type        = "list"
  description = "extra tags for dataproc nodes"
  default     = []
}

variable internal_hosts {
  type        = "string"
  description = "Comma-separated list of wielder on-prem hosts to be added to /etc/hosts"
  default     = ""
}

variable scripts {
  type        = "string"
  description = "User defined scripts for instance startup. This needs to be the CONTENT of any scripts that need to be run at startup."
  default     = ""
}

variable locator_url {
  type        = "string"
  description = "Locator Service URL - required to update cluster metadata yarn.config.dir. This variable is optional and by default, the URL will be interpolated."
  default     = ""
}

variable locator_cluster_name {
  type        = "string"
  description = "This is the cluster name of the Dataproc cluster in Locator Service. In GCP, the name is of this format <DC>-<app_name>-yarn, for example, gusw1int-sirius-yarn. This variable is optional and by default, the cluster name will be interpolated. In some cases, this cluster name needs to be overridden because it deviates from the pattern."
  default     = ""
}

variable "enable_set_dns" {
  description = "Flag to enable registering with wielder DNS via set_dns script/function"
  default     = "false"
}

variable "internal_ip_only" {
  type = "string"
  default = true
  description = "Allowing external IPs'"
}