#Create EC2 instance using a Linux AMI
resource "aws_instance" "web" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  subnet_id = var.subnet_id

  vpc_security_group_ids = [var.security_group]

  iam_instance_profile = var.instance_profile

  user_data = file("{path.module}../../sripts/user_data.sh

  tags = {
    Name = "terraform-practice-instance"
  }
}