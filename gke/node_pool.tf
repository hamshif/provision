
resource "google_container_cluster" "wielder-container-cluster" {

  name = "${var.container_cluster_name}-master"
  location = "${var.location}"

  remove_default_node_pool = true
  initial_node_count = 1

  //  initial_node_count = "${var.cluster_count}"
  node_locations = "${var.node_locations}"
  network = "${var.network}"
  subnetwork = "${var.subnetwork}"
  enable_kubernetes_alpha = "${var.enable_kubernetes_alpha}"
  min_master_version = "${var.min_master_version}"
  enable_legacy_abac = "${var.enable_legacy_abac}"

  master_auth {
    username = "${var.username}"
    password = "${var.password}"
  }

  //  node_config {
  //    machine_type = "${var.machine_type}"
  //    disk_size_gb = "${var.disk_size_gb}"
  //    local_ssd_count = "${var.local_ssd_count}"
  //    oauth_scopes = "${var.oauth_scopes}"
  //    tags = "${var.tags}"
  //
  //    labels {
  //      purpose = "dev-rtp-poc-cluster"
  //    }
  //  }

  addons_config {
    http_load_balancing {
      disabled = "${var.http_load_balancing_disable}"
    }

    horizontal_pod_autoscaling {
      disabled = "${var.horizontal_pod_autoscaling_disable}"
    }
  }

  lifecycle {
    ignore_changes = ["node_pool"]
  }

}

resource "google_container_node_pool" "wielder-container-cluster_node_pool" {
  name = "rtp-node-pool"
  location = "${var.location}"
  cluster = "${google_container_cluster.wielder-container-cluster.name}"
  node_count = "${var.minNodeCount_node}"

  node_config {
    machine_type = "${var.machine_type}"
    disk_size_gb = "${var.disk_size_gb}"
    local_ssd_count = "${var.local_ssd_count}"
    oauth_scopes = "${var.oauth_scopes}"
    tags = "${var.tags}"


    labels {
      purpose = "dev-wielder-container-cluster"
    }
  }

  # Find out why this dosn't work
  # Autoscale
  autoscaling {
    min_node_count = "${var.minNodeCount_node}"
    max_node_count = "${var.maxNodeCount_node}"
  }
}



