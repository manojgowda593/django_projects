resource "aws_iam_role" "ecsTaskExecutionRole" {
  name = "ecs_task_execution_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
        Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  role       = aws_iam_role.ecsTaskExecutionRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}


data "aws_iam_policy_document" "ecs_sm_access" {
  statement {
    actions   = ["secretsmanager:GetSecretValue"]
    resources = [aws_secretsmanager_secret.todo_db_secrets.arn]
  }
}

resource "aws_iam_role_policy" "ecs_sm_policy" {
  role   = aws_iam_role.ecsTaskExecutionRole.id
  policy = data.aws_iam_policy_document.ecs_sm_access.json
}
