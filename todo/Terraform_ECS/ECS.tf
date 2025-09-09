resource "aws_ecs_cluster" "todo-cluster" {
  name = "todo"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}


resource "aws_ecs_task_definition" "todo-task" {
  family = "todo-service"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = aws_iam_role.ecsTaskExecutionRole.arn
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  container_definitions = jsonencode([
    {
      name      = "todo"
      image     = "manoj1593/ecs-todo:latest"
      essential = true
      portMappings = [
        {
          containerPort = 8000
          hostPort      = 8000
          protocol      = "tcp"
        }
      ]
      secrets = [{
            name = "DB_USERNAME"
            valueFrom = "${aws_secretsmanager_secret.todo_db_secrets.arn}:username::"
        },
        {
            name = "DB_ENGINE"
            valueFrom = "${aws_secretsmanager_secret.todo_db_secrets.arn}:engine::"
        },
        {
            name = "DB_PASSWORD"
            valueFrom = "${aws_secretsmanager_secret.todo_db_secrets.arn}:password::"
        },
        {
            name = "DB_NAME"
            valueFrom = "${aws_secretsmanager_secret.todo_db_secrets.arn}:db::"
        },
        {
            name = "DB_HOST"
            valueFrom = "${aws_secretsmanager_secret.todo_db_secrets.arn}:server_name::"
        },
        {
            name = "DB_PORT"
            valueFrom = "${aws_secretsmanager_secret.todo_db_secrets.arn}:port::"
        }
        ]
    },
  ])
}



resource "aws_ecs_service" "todo-service" {
  name            = "todo-service"
  cluster         = aws_ecs_cluster.todo-cluster.id
  task_definition = aws_ecs_task_definition.todo-task.id
  desired_count   = 1
  launch_type     = "FARGATE"
  # iam_role        = aws_iam_role.ecsTaskExecutionRole.arn
  network_configuration {
    subnets = [aws_subnet.public_sub.id, aws_subnet.public_sub_2.id]
    security_groups = [ aws_security_group.ecs_sg.id ]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.todo_target_group.arn
    container_name   = "todo"
    container_port   = 8000
  }
}



# Add this to your network / VPC Terraform file (vpc.tf)
# resource "aws_vpc_endpoint" "secretsmanager" {
#   vpc_id            = aws_vpc.todo-vpc.id
#   service_name      = "com.amazonaws.ap-south-1.secretsmanager"
#   vpc_endpoint_type = "Interface"
#   subnet_ids        = [aws_subnet.public_sub.id, aws_subnet.public_sub_2.id]
#   security_group_ids = [aws_security_group.ecs_sg.id]

#   private_dns_enabled = true

#   tags = {
#     Name = "secretsmanager-endpoint"
#   }
# }
