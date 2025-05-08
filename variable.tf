variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance"
  type        = string
  default     = "ami-0ed3691ac6be95a4e"
}

variable "instance_type" {
  description = "The type of instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the existing key pair"
  type        = string
  default     = "prag" 
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
  default     = "prgade"
}