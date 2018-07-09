variable "aws_ami" {
  description = "ID of AMI to use for the instances. IMPORTANT: Currently only Amazon Linux is supported!"
  default     = "ami-39d39d41"
}

variable "vpc_id" {
  description = "VPC ID where the cluster will be created"
}

variable "subnet_ids" {
  description = "The list of subnet IDs where the cluster will be created. Master node will be created in teh first subnet mentioned in this list"
  type        = "list"
}

variable "master_vpc_security_group_ids" {
  description = "A list of security group IDs to associate master instance with"
  type        = "list"
}

variable "slave_vpc_security_group_ids" {
  description = "A list of security group IDs to associate slave instances with"
  type        = "list"
}

variable "slave_instance_type" {
  description = "Instance type for slave nodes"
  default     = "t2.micro"
}

variable "master_instance_type" {
  description = "Instance type for master node"
  default     = "t2.medium"
}

variable "slave_ssh_public_key_file" {
  description = "SSH public key filename for slave nodes"
}

variable "master_ssh_public_key_file" {
  description = "SSH public key filename for master node"
}

variable "master_ssh_private_key_file" {
  description = "SSH private key filename for master node"
}

variable "slave_asg_size" {
  description = "Amount of working nodes in ASG"
  default     = "2"
}

variable "jmeter3_url" {
  description = "URL with jmeter archive"
  default     = "https://archive.apache.org/dist/jmeter/binaries/apache-jmeter-3.3.tgz"
}
