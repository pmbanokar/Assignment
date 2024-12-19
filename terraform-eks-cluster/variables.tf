variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "cluster_name" {
  description = "EKS Cluster Name"
  default     = "nodejs-eks-cluster"
}

variable "node_instance_type" {
  description = "EC2 instance type for worker nodes"
  default     = "t3.medium"
}
