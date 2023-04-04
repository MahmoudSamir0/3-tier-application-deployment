  #!/bin/bash
  sudo apt update -y
  sudo curl -fsSL https://test.docker.com -o test-docker.sh
  sudo sh test-docker.sh
  sudo groupadd docker
  sudo usermod -aG docker $USER
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  sudo ./aws/install
$(aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_url})
docker run -p 3000:3000 --restart always -e RDS_HOSTNAME=${rds_hostname} -e RDS_USERNAME=${rds_username} -e RDS_PASSWORD=${rds_password} -e RDS_PORT=${rds_port} -e RDS_DB_NAME=${rds_db_name} -d ${ecr_url}/${ecr_repo_name}:latest

