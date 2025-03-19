output "cluster_id" {
  value = aws_eks_cluster.devops_eks_cluster.id
}

output "node_group_id" {
  value = aws_eks_node_group.devops_eks_node_group.id
}

output "vpc_id" {
  value = aws_vpc.devops_vpc.id
}

output "subnet_ids" {
  value = aws_subnet.devops_subnet[*].id
}