data "oci_identity_availability_domain" "ad" {
  compartment_id = var.tenancy_ocid
  ad_number      = var.ad_number
}

data "template_file" "setup_gitlab-OL" {
  template = file("${path.module}/scripts/setup_omnibox-OL.sh")
}
