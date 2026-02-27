output "vpc_id" {
  value = aws_vpc.eks_vpc.id
}

output "pub_ass_subnet1" {
  value = aws_subnet.pub_sub1.id
}

output "pub_ass_subnet2" {
  value = aws_subnet.pub_sub2.id
}

output "eks_cluster" {
  value = aws_eks_cluster.eks_cluster.id
}

output "eks_clustter_endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "runner_public_ip" {
  value = aws_instance.my_ec2.id
}

output "kubeconfig_command" {
  value = "aws eks update-kubeconfig --name my-eks-cluster --region eu-north-1"
}















