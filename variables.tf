variable "region" {
  default = "us-east-1"
}
variable "vpc-fullcidr" {
  default     = "192.168.0.0/16"
  description = "the vpc cdir"
}
variable "Subnet-Public-AzA-CIDR" {
  default     = "192.168.1.0/24"
  description = "the cidr of the 2a-Public Subnet"
}
variable "Subnet-Private-AzA-CIDR" {
  default     = "192.168.2.0/24"
  description = "the cidr of the 2a-Private Subnet"
}
variable "Subnet-Public-AzB-CIDR" {
  default     = "192.168.3.0/24"
  description = "the cidr of the 2b-Public Subnet"
}
variable "Subnet-Private-AzB-CIDR" {
  default     = "192.168.4.0/24"
  description = "the cidr of the 2b-Private Subnet"
}
variable "key_name" {
  default     = "recovery"
  description = "the ssh key to use in the EC2 machines"
}

variable "ami" {
  default     = "ami-09e67e426f25ce0d7"
}

variable "rds_user" {
  default     = "admin"
}

variable "rds_pwd" {
  default     = "admin12345"
}
