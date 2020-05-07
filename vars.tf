variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION"{
type = string
default = "ap-south-1"
}

variable "AMIS"{
type = map
default = {
ap-south-1 = "ami-0c5b1a88222ac79cb"
eu-west-1 = "ami-0dad359ff462124ca"
us-east-1 = "ami-068663a3c619dd892"
us-west-1 = "ami-075fd582acf0c0128"
}
}
