
variable "project_id" {
  type = "string"
  description = "Project ID."
  default = "rtp-gcp-poc"
}

variable "deploy_zone" {
  type = "string"
  description = "Deploy Zone."
  default = "europe-west1-b"
}


variable "json_credentials_path" {
  type = "string"
  description = "Path to json key."
}

provider "google" {
  credentials = "${file(var.json_credentials_path)}"
  project     = "${var.project_id}"
  region      = "${var.deploy_zone}"
}





