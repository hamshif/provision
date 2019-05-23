
terraform {
  backend "gcs" {
    bucket  = "wielder_terraform"
    prefix  = "terraform/dataproc/state"
  }
}

locals {
  cluster_name         = "${format("%s-%s-%s-%s-%s-%s", var.location_code, var.env, var.app_name, "dataproc", var.cluster_id, var.rack)}"
}


resource "google_dataproc_cluster" "main" {

  project = "${var.project_id}"
  name    = "${local.cluster_name}"
  region  = "${var.region}"

  labels = {
    foo = "bar"
  }

  cluster_config {
//    staging_bucket        = "dataproc-staging-bucket"


    master_config {
      num_instances = "${var.high_availability ? 3 : 1}"
      machine_type  = "${var.master_machine_type}"

      disk_config {
        boot_disk_size_gb = "${var.master_boot_disk_size}"
        boot_disk_type = "pd-ssd"
      }
    }

    worker_config {
      num_instances = "${var.num_worker_nodes}"
      machine_type  = "${var.worker_machine_type}"

      disk_config {
        boot_disk_size_gb = "${var.worker_boot_disk_size}"
        num_local_ssds    = "${var.num_local_ssds}"
      }
    }

    preemptible_worker_config {
      num_instances = "${var.num_preemptible_workers}"
    }

    # Override or set some custom properties
    software_config {
      image_version       = "${var.image_version}"
      override_properties = {
        "dataproc:dataproc.allow.zero.workers" = "true"
        "dataproc:dataproc.logging.stackdriver.enable" = "true"
        "dataproc:dataproc.enable_component_gateway" = "true"
      }
    }

    gce_cluster_config {

      zone    = "${var.zone}"
      #network = "${google_compute_network.dataproc_network.name}"
      tags    = ["foo", "bar", "zeppelin-gid"]
    }

    # You can define multiple initialization_action blocks
    initialization_action {
      script      = "gs://dataproc-initialization-actions/stackdriver/stackdriver.sh"
      timeout_sec = 500
    }

    initialization_action {
      script      = "gs://dataproc-initialization-actions/zeppelin/zeppelin.sh"
      timeout_sec = 600
    }

  }
}