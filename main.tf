# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Defaults are given in this configuration and the defaults.auto.tfvars file.
# Both will be overridden by values passed down by the manager configuration.

#
# Variables
#

variable "sens_tf_var" {
  default = ""
  sensitive = true
}

variable "sens_env_var" {
  default = ""
  sensitive = true
}

variable "a_string" {
  type = string
  default = "a default string"
}


# Value is initially supplied via some.auto.tfvars
variable "a_number" {
  type = number
}

variable "a_list" {
  type = list(string)
  default = []
}

# Value is initially supplied via some.auto.tfvars
variable "a_map" {
  type = map(string)
}

variable "a_single_var" {
  default = ""
}

#
# Output all of the variables for demonstration purposes
#

output "sens_tf_var" {
  value = var.sens_tf_var
  sensitive = true
}

output "a_string" {
  value = var.a_string
}

output "a_number" {
  value = var.a_number
}

output "a_list" {
  value = var.a_list
}

output "a_map" {
  value = var.a_map
}

output "a_single_var" {
  value = var.a_single_var
}

# Print the value of the environment variables
/*
resource "null_resource" "env_vars" {
  provisioner "local-exec" {
    command = <<EOT
      echo an_env = $an_env
      echo another_env = $another_env
      echo sens_env_var = $sens_env_var
    EOT
  }
}
*/
 
variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  default     = "Provisioned by Terraform"
}

provider "aws" {
  region = var.region
  access_key = "AKIASSWMWFGSV5JKSE57"
  secret_key = "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"
}


resource "aws_vpc" "main" {
 cidr_block = "10.0.0.0/16"
 
 tags = {
   Name = "mvc-demo"
 }
}
