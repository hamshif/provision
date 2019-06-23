variable "container_cluster_name" {
  type = "string"
  description = "The name of the cluster, unique within the project and zone"
}

variable "enable_kubernetes_alpha" {
  type = "string"
  description = "allow cutting edge features"
}


variable "min_master_version" {
  type = "string"
  description = "kubernetes version of cluster nodes"
}


variable "enable_legacy_abac" {
  type = "string"
  description = "kubernetes version of cluster nodes"
}


variable "location" {
  type = "string"
  description = "The zone location that the master and the number of nodes specified in initial_node_count should be created in"
}

variable "cluster_count" {
  type = "string"
  description = "The number of nodes to create in this cluster (not including the Kubernetes master)"
}

variable "node_locations" {
  type = "list"
  description = "If additional zones are configured, the number of nodes specified in initial_node_count is created in all specified zones"
}

variable "machine_type" {
  type = "string"
  description = "The name of a Google Compute Engine machine type"
}

variable "disk_size_gb" {
  type = "string"
  description = "Size of the disk attached to each node, specified in GB"
}

variable "local_ssd_count" {
  type = "string"
  description = " The amount of local SSD disks that will be attached to each cluster node"
}

variable "oauth_scopes" {
  type = "list"
  description = "The set of Google API scopes to be made available on all of the node VMs under the default service account"
}

variable "tags" {
  type = "list"
  description = "The list of instance tags applied to all nodes. Tags are used to identify valid sources or targets for network firewalls."
}


// Auth API K8S

variable "username" {
  type = "string"
  description = "The username to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
}

variable "password" {
  type = "string"
  description = "The password to use for HTTP basic authentication when accessing the Kubernetes master endpoint"
}


// Auto-scaling

variable "http_load_balancing_disable" {
  type = "string"
  description = "The status of the HTTP Load Balancing add-on"
}

variable "horizontal_pod_autoscaling_disable" {
  type = "string"
  description = "The status of the Horizontal Pod Autoscaling addon"
}


// Network

variable "network" {
  type = "string"
  description = "The name or self_link of the Google Compute Engine network to which the cluster is connected"
}

variable "subnetwork" {
  type = "string"
  description = "Name of the subnet to which to attach the cluster"
}


// Nodes

variable "machine_type_node" {
  type = "string"
  description = "The name of a Google Compute Engine machine type"
}

variable "disk_size_gb_node" {
  type = "string"
  description = "Size of the disk attached to each node, specified in GB"
}

variable "local_ssd_count_node" {
  type = "string"
  description = "The amount of local SSD disks that will be attached to each node pool"
}


// Node Autoscale

variable "minNodeCount_node" {
  type = "string"
  description = "Minimum number of nodes in the NodePool"
}

variable "maxNodeCount_node" {
  type = "string"
  description = "Maximum number of nodes in the NodePool"
}