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


output "cluster_name" {
  value = "${local.cluster_name}"
}

output "master_instance_names" {
  description = "List of master instance names"
  value       = "${google_dataproc_cluster.main.cluster_config.0.master_config.0.instance_names}"
}

output "worker_instance_names" {
  description = "List of worker instance names"
  value       = "${google_dataproc_cluster.main.cluster_config.0.worker_config.0.instance_names}"
}

output "preemptible_worker_instance_names" {
  description = "List of preemptible worker instance names"
  value       = "${google_dataproc_cluster.main.cluster_config.0.preemptible_worker_config.0.instance_names}"
}
