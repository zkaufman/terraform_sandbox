#Variables declared in this file must be declared in the marketplace.yaml
#Provide a description to your variables.

############################
#  Hidden Variable Group   #
############################
variable "tenancy_ocid" {
}

variable "region" {
}

variable "current_user_ocid" {
}

variable "compartment_ocid" {
}

############################
#  GitLab Configuration    #
############################
variable "external_url" {
  default = ""
  description = "For GitLab to display correct repository clone links to your users, it needs to know the URL under which it is reached by your users, e.g. http://gitlab.example.com"
}

############################
# Deployment Configuration #
############################

variable "compute_compartment_ocid" {
  description = "Compartment where Network and compute resources will be created"
}

variable "availability_domain_name" {
  default     = ""
  description = "Availability Domain"
}

variable "ad_number" {
  default     = 1
  description = "OCI Availability Domains: 1,2,3  (subject to region availability)"
}

variable "ssh_public_key" {
  description = "SSH Public Key"
}

#############################
##  Compute Condiguration   #
#############################

variable "compute_strategy" {
  #default = "Use recommended"
  default = "Customize"
}

variable "bastion_server_shape" {
  default = "VM.Standard.E3.Flex"
}

variable "gitlab_server_shape" {
  default = "VM.Standard.E3.Flex"
}

variable "redis_server_shape" {
  default = "VM.Standard.E3.Flex"
}

variable "postgres_server_shape" {
  default = "VM.Standard.E3.Flex"
}

variable "gitaly_server_shape" {
  default = "VM.Standard.E3.Flex"
}

variable "monitoring_server_shape" {
  default = "VM.Standard.E3.Flex"
}

variable "bastion_server_ocpus" {
 default = 1
} 

variable "gitlab_server_ocpus" {
 default = 4
} 

variable "redis_server_ocpus" {
 default = 1
} 

variable "postgres_server_ocpus" {
 default = 1
} 

variable "gitaly_server_ocpus" {
 default = 2
} 

variable "monitoring_server_ocpus" {
 default = 1
} 

variable "bastion_server_ram" {
 default = 2
} 

variable "gitlab_server_ram" {
 default = 8
} 

variable "redis_server_ram" {
 default = 4
} 

variable "postgres_server_ram" {
 default = 8
} 

variable "gitaly_server_ram" {
 default = 16
} 

variable "monitoring_server_ram" {
 default = 2
} 

variable "compute_image_strategy_enum" {
type = map
default = {
  PLATFORM_IMAGE = "Platform Image - Oracle Linux 8"
  CUSTOM_IMAGE = "Custom Image - Oracle Linux 8"
}
}

variable "compute_image_strategy" {
  description = "Use either Platform Image or Custom Image"
  default     = "Platform Image - Oracle Linux 8"
}

variable "platform_image_ocid" {
  description = "Compute Platform Image available for this particular region"
  default     = "ocid1.image.oc1.iad.aaaaaaaapxf2h62uxysjewwrgo5tkohb5frlf2wpzawmxgncxdy7vwnm7aza"
}

variable "custom_image_ocid" {
  description = "Enter the Compute Custom Image ocid available for this particular region based on  selected Operating System."
  default     = ""
}


#############################
##  Network Configuration   #
#############################

variable "network_strategy" {
  #default = "Use Existing VCN"
  default = "Create New VCN"
}

variable "vcn_id" {
  default = ""
}

variable "public_bastion_subnet_id" {
  default = ""
}

variable "public_LB_subnet_id" {
  default = ""
}

variable "private_subnet_id" {
  default = ""
}

variable "network_compartment_ocid" {
  description = "Compartment where Network and compute resources will be created"
}

variable "tag_key_name" {
  description = "Free-form tag key name"
  default     = "oracle-quickstart"
}

variable "tag_value" {
  description = "Free-form tag value"
  default     = "oci-gitlab"
}

variable "network_strategy_enum" {
  type = map
  default = {
    CREATE_NEW_PUBLIC_VCN_SUBNET   = "Create New VCN and Subnets"
    USE_EXISTING_PUBLIC_VCN_SUBNET = "Use Existing VCN and Subnets"
  }
}

variable "gitlab_vcn_dns_label" {
  default = "gitlabvcn" 
}

variable "bastion_public_subnet_dns_label" {
  default = "bastionsubnet"
}

variable "LB_public_subnet_dns_label" {
  default = "LBsubnet"
}

variable "gitlab_private_subnet_dns_label" {
  default = "gitlabsubnet"
}

variable "gitlab_vcn_cidr_block" {
  default = "10.0.0.0/22"
}

variable "bastion_public_subnet_cidr_block" {
  default = "10.0.0.0/24"
}

variable "LB_public_subnet_cidr_block" {
  default = "10.0.1.0/24"
}

variable "gitlab_private_subnet_cidr_block" {
  default = "10.0.2.0/24"
}

#######################
##   Object Storage   #
#######################

variable "access_key_strategy" {
  default     = "Create New Access Key Pair"
}

variable "access_key_strategy_enum" {
  type = map
  default = {
    CREATE_NEW_ACCESS_KEYS   = "Create New Access Key Pair"
    USE_EXISTING_ACCESS_KEYS = "Use Existing Access Key Pair"
  }
}

variable "access_key" {
  description = "Customer Access Key"
  default     = ""
} 

variable "secret_key" {
  description = "Secret Key"
  default     = ""
  sensitive   = true
} 

variable "backup_upload_remote_directory" {
  default     = "gitlab_backup_bucket"
}

variable "artifacts" {
  default     = "gitlab_artifacts"
}


variable "external_diffs" {
  default     = "gitlab_external_diffs"
}

variable "lfs" {
  default     = "gitlab_lfs_objects"
}


variable "uploads" {
  default     = "gitlab_uploads"
}


variable "packages" {
  default     = "gitlab_packages"
}


variable "dependency_proxy" {
  default     = "gitlab_dependency_proxy"
}


variable "terraform_state" {
  default     = "gitlab_terraform_state"
}

variable "secrets_bucket" {
  default     = "gitlab_secrets"
}

variable "customize_bucket_names" {
  default     = "false"
}
 
#######################
##   SMTP Credentials #
#######################

variable "smtp_strategy" {
  default     = "Create New SMTP Credentials"
}

variable "smtp_strategy_enum" {
  type = map
  default = {
    CREATE_NEW_SMTP_CREDENTIALS   = "Create New SMTP Credentials"
    USE_EXISTING_SMTP_CREDENTIALS = "Use Existing SMTP Credentials"
  }
}

variable "smtp_username" {
  description = "SMTP Username"
  default     = ""
} 

variable "smtp_password" {
  description = "SMTP Password"
  default     = ""
  sensitive   = true
}

 
############################
##   Certs and private key #
############################

variable "listener_ca_certificate" { 
  default = ""
}

variable "listener_private_key" { 
  default = ""
}

variable "listener_public_certificate" { 
  default = ""
}
