data "aws_ami" "ami" {
  most_recent      = true
  owners           = [var.owner[var.image]]

  filter {
    name   = "name"
    values = ["${var.ami_name[var.image]}*"]
  }
}

resource "aws_instance" "demo" {
  count = var.instance_count
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type[var.instance_size]

  tags = {
    Name = "tf-aod-demo-${count.index}"
  }
}

resource "aws_ebs_volume" "data" {
  count = var.volume_count
  availability_zone = aws_
  size              = var.volume_size[var.instance_size]
}