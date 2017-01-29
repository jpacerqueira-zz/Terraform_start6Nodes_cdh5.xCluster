variable "cidr_block" {
  description = "CIDR block you want to have in your VPC"
  default = "10.0.0.0/16"
}

variable "project" {
  description = "This is a project, jira_ticket or username"
  default = "unixsupport-000"
}

variable "environment" {
  description = "Environment"
  default = "hadooptest"
}

variable "cdh_sg_id" {
  description = "We need this so we can reference 'self-ingress/egress rules'"
  default = "sg-d12d34d5"
}

variable "availability_zones" {
  description = "List of availability zones for the region"
  default = {
    az0 = "eu-west-1a"
    az1 = "eu-west-1b"
    az2 = "eu-west-1c"
  }
}

variable "sample_hostnames" {
  description = "List of sample userfriendly hostnames"
  default = {
    "0" = "nn1elephant"
    "1" = "nn2tiger"
    "2" = "dn1horse"
    "3" = "dn2monkey"
    "4" = "cm1lion"
    "5" = "dn4snake"
  }
}

variable "cdh_nodes" {
  description = "amount of hadoop nodes"
  default = 6
}

variable "number_of_azs" {
  description = "How many Availability Zones we're building out to"
  default     = 3
}

variable "cidr_allocation_subnets" {
  description = "CIDR allocations for subnets"
  type = "map"
  default = {
    public0       = "10.0.1.0/24"
    public1       = "10.0.2.0/24"
    public2       = "10.0.3.0/24"
    private0      = "10.0.4.0/24"
    private1      = "10.0.5.0/24"
    private2      = "10.0.6.0/24"
  }
}

variable "instance_type" {
  description =  "AWS instance type"
  default = "t2.medium"
}
