resource "oci_core_instance" "bastion-server" {
  availability_domain = data.oci_identity_availability_domain.ad.name 
  compartment_id      = "ocid1.compartment.oc1..aaaaaaaadt4ydl2rxmw3hrx4cfq6zddadglrtls3c6fsbgwg4ktabije7e5q" 
  display_name        = "bastion-server"
  shape               = "VM.Standard.E3.Flex"

  dynamic "shape_config" {
    for_each = [1]
    content {
      ocpus = 1 
      memory_in_gbs = 2
    }
  }

  create_vnic_details {
    subnet_id              = "ocid1.subnet.oc1.iad.aaaaaaaam2fuey7gwncq5hc33n2qmefmfdwkcbttdiftpp3o6wp6c6pjmrxa"
    display_name           = "bastion-server"
    assign_public_ip       = true
    hostname_label         = "bastion-server"
    skip_source_dest_check = false
    nsg_ids                = [oci_core_network_security_group.simple_nsg.id]
  }

  source_details {
    source_type = "image"
    source_id   = "ocid1.image.oc1.iad.aaaaaaaapxf2h62uxysjewwrgo5tkohb5frlf2wpzawmxgncxdy7vwnm7aza"
  }
 
  metadata = {
    ssh_authorized_keys = var.ssh_public_key
    user_data = base64encode(join("\n", list(
      "#!/usr/bin/env bash",
      "set -x",
      data.template_file.setup_gitlab-OL.rendered,
    )))
  }
 
  freeform_tags = map(var.tag_key_name, var.tag_value)
}
