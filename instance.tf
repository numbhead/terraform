resource "aws_key_pair" "mykey" {
key_name = "mykey"
public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_instance" "Terra_Instance1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = aws_key_pair.mykey.key_name

provisioner "file" {
source = "scripts/script.sh"
destination = "/tmp/script.sh"
}

provisioner "remote-exec" {
inline = [
"chmod +x /tmp/script.sh",
"sudo /tmp/script.sh"
]
}

connection {
host = coalesce(self.public_ip,self.private_ip)
type = "ssh"
user = var.INSTANCE_USER_NAME
private_key = file(var.PATH_TO_PRIVATE_KEY)
}
}
