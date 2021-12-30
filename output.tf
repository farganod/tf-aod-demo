output "image_id" { 
    description = "AMI ID used to deploy the instance"
    value = data.aws_ami.ami.id
}

output "instance_ids" {
    description = "Instance id(s) of the EC2 instances deployed"
    value = aws_instance.demo.*.id
}