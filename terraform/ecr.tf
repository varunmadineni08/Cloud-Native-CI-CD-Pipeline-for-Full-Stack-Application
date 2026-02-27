resource "aws_ecr_repository" "app_repo" {
  name="docker-demo"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
     Name="my_ecr"
  }

}