resource "aws_eks_cluster" "eks_cluster" {
  name     = "my-eks-cluster"
  role_arn = aws_iam_role.eks_role.arn

  vpc_config {
    subnet_ids = [
      aws_subnet.pub_sub1.id,
      aws_subnet.pub_sub2.id
    ]
  }
  depends_on = [aws_iam_role_policy_attachment.eks_policy]
}