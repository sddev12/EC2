variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "instance_ami" {
  type        = string
  default     = "ami-053a617c6207ecc7b"
  description = "The AMI to use for your instance. Default is Ubuntu 20.04"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "The tye of incance you want to create"
}

variable "key_name" {
  type        = string
  default     = "ubuntu-ec2"
  description = "The name for your key pair"
}

variable "public_key_file" {
  type        = string
  default     = "./data/ec2.pub"
  description = "Path to your public key file"
}

variable "tags" {
  type = map(string)
  default = {
    "project" = "ec2"
  }
}
