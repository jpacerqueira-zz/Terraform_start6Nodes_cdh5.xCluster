provider "aws" {
   region = "eu-west-1"
   #(if you want to hardcode keys)
   #access_key = "AKIAJ4I4F2GY75KZRTEA"
   #secret_key = "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"
}

variable "aws_region" {
  description = "The AWS region to work in."
  default = "eu-west-1"
}

variable "ami" {
    #default = "ami-f9dd458a"
    default =  "ami-2be8da5c"
}

variable "key_name" {
    description = " ssh access key name "
    #default = "cloudera_training"
    default = "reporting_cluster"
}

variable "local_key_file" {
    description = " local ssh file "
    default = "reporting_cluster.pem"
}

variable "my_rootdir" {
    description = " my homedir for logs and ssh key stuff "
    default = "/Users/jpacerqueira"
}

variable "whitelisted_source" {
   description = "this is the public address of your PC"
   #default = "92.20.8.175/32"
   default = "79.71.166.8/32"
}
