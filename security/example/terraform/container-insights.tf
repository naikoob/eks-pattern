
resource "aws_iam_role_policy_attachment" "cloudwatch_agent_policy" {
  policy_arn  = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role        = module.eks.worker_iam_role_name
}

resource "local_file" "container-insights" {
  content = templatefile("templates/container-insights.yaml.tpl", {
    CLUSTER_NAME                = module.eks.cluster_id
  })
  filename = "outputs/container-insights.yaml"
}
