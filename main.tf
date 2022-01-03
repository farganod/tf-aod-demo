# pulls the most recent ami for the image selected
data "aws_ami" "ami" {
  most_recent      = true
  owners           = [var.owner[var.image]]

  filter {
    name   = "name"
    values = ["${var.ami_name[var.image]}*"]
  }
}

# once the instance is launched the data type allows reference of availability zone used for the volume
data "aws_instance" "demo_data" {
  count = var.instance_count
  instance_id = aws_instance.demo[count.index].id

}

# launches instances based on t-shirt sizing and instance count
resource "aws_instance" "demo" {
  count = var.instance_count
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type[var.instance_size]

  tags = {
    Name = "tf-aod-demo-${count.index}"
  }
  lifecycle { 
    ignore_changes = [ami] # ignores ami changes if/when it's updated to not delete the instances  
  }
}

# creates and ebs volumes based on t-shirt sizing and instance count
resource "aws_ebs_volume" "volume" {
  count = var.instance_count
  availability_zone = data.aws_instance.demo_data[count.index].availability_zone
  size              = var.volume_size[var.instance_size]
}

# attaches volumes to instances
resource "aws_volume_attachment" "volume_att" {
  count = var.instance_count
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.volume[count.index].id
  instance_id = aws_instance.demo[count.index].id
}