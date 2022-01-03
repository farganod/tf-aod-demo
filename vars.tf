# Vars file used for the module
variable instance_count {
    type = number
    description = "Number of instances you'd like to deploy"
    default = 2
}

variable instance_size {
    type = string
    description = "Size of your instance: small, medium, large, x-large"
    default = "medium"
}

variable instance_type {
    type = map
    description = "Matches size varible to corrisponding instance type, no input required"
    default = {
        "small" = "t3.small"
        "medium" = "t3.medium"
        "large" = "t3.large"
        "x-large" = "t3x-large"
    }
}

variable image {
    type = string
    description = "Type of image you want to deploy: linux or windows"
    default = "linux"
}

variable owner {
    type = map
    description = "Maps the image selected to the owner for ami, no input required"
    default = {
        "linux" = "amazon"
        "windows" = "801119661308"
    }
}

variable ami_name {
    type = map
    description = "Maps the image selected to the owner for ami, no input required"
    default = {
        "linux" = "amzn2-ami-kernel-5.10-hvm"
        "windows" = "Windows_Server-2019-English-Full-Base"
    }
}

variable volume_size {
    type = map
    description = "Size of volumes based on instance size, no input required"
    default = {
        "small" = 50
        "medium" = 75
        "large" = 100
        "x-large" = 150
    }
}