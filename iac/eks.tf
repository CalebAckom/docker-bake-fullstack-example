resource "aws_eks_cluster" "devops_eks_cluster" {
  name     = "devops-cluster"
  role_arn = aws_iam_role.devops_cluster_role.arn

  vpc_config {
    subnet_ids         = aws_subnet.devops_subnet[*].id
    security_group_ids = [aws_security_group.devops_cluster_sg.id]
  }
}

resource "aws_eks_node_group" "devops_eks_node_group" {
  cluster_name    = aws_eks_cluster.devops_eks_cluster.name
  node_group_name = "devops-node-group"
  node_role_arn   = aws_iam_role.devops_node_group_role.arn
  subnet_ids      = aws_subnet.devops_subnet[*].id

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

  instance_types = ["t2.medium"]

#   remote_access {
#     source_security_group_ids = [aws_security_group.devops_node_sg.id]
#     ec2_ssh_key               = var.ssh_key_name
#   }
}
