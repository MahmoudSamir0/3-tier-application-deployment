resource "null_resource" "build_and_push" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${module.ecr_repository.repository_url}"
  }

  provisioner "local-exec" {
    command = "docker build -t ${module.ecr_repository.repository_url}:latest ."
  }

  provisioner "local-exec" {
    command = "docker push ${module.ecr_repository.repository_url}:latest"
  }
  depends_on = [
    module.ecr_repository
  ]
}
