provider "aws"{
    region = "us-east-1"
}

module "test"{
    source = "../."
    instance_count = 4
    instance_size = "large"
    image = "linux"
    
}