# jMeter cluster in AWS Terraform module
The easy way to create jMeter cluster with terraform on your AWS infrastructure.

# Prerequisites
[HashiCorp Terraform](https://www.terraform.io/)

# How to use
1. Generate ssh keys - e.g. you can use ssh-keygen tool
  ```
  ssh-keygen -t rsa -C "loadServer" -P '' -f loadServer
  ```
3. Create a wrapper terraform configuration, for example:
  ```
  # main.tf

  provider "aws" {
    region = "us-west-2"
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
  }

  module "jmeter_cluster" {
    source = "github.com/legal90/terraform-aws-jmeter"

    aws_ami = "ami-39d39d41"

    slave_ssh_public_key_file   = "~/.ssh/id_rsa.pub"
    master_ssh_public_key_file  = "~/.ssh/id_rsa.pub"
    master_ssh_private_key_file = "~/.ssh/id_rsa"
  }
  ```

  N.B. Please see variables.tf for full reference on `terraform-aws-jmeter` variables - at least be sure to change instance types as you can't do much with micro instances.

4. Use this commands to create infrastructure

  ```
  # terraform init
  # terraform apply
  ```
5. Login to the master node by SSH (with a key specified) and start the load test - N.B. You can get master node public ip using `terraform show` command.

  N.B. It requires some time to start slave nodes and in case they're didn't for some reason, you can do it manually by SSHing to slave nodes and executing `/opt/jmeter/bin/jmeter-server` command

6. You can destroy the infrastructure with `terraform destroy`

# How does it work
terraform-aws-jmeter creates one master instance and autoscaling group with jmeter workers. Both master and workers share the same security group which allows all ingress and egress communications inside the group, only ssh ingress connections for other world. It allows egress communications for all ports for outside world as well though to make sure jmeter can access resource it's testing.

# Links
1. http://jmeter.apache.org/usermanual/remote-test.html
2. http://aws.amazon.com/
3. https://www.terraform.io/
4. http://jmeter.apache.org/
