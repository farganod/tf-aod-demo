output "image_id" { 
    description = "AMI ID used to deploy the instance"
    value = data.aws_ami.ami.id
}

output "instance_ids" {
    description = "Instance id(s) of the EC2 instances deployed"
    value = aws_instance.demo.*.id
}

output "volume_ids"{
    description = "Volume id(s) attached to instance(s) [1:1 correlation]"
    value = aws_ebs_volume.volume.*.id
}