provider "aws" {
  profile    = "lars@kintyredev"
  region     = "us-east-1"
}

resource "aws_instance" "example" {
  ami             = "ami-b73b63a0"
  instance_type   = "t2.micro"
  key_name        = "lars"
  security_groups = [ "lars" ]

  tags {
    Name = "terraform-splunk"
  }

  user_data = <<-EOF
    #!/bin/bash
    wget -O /root/splunk-6.5.1-f74036626f0c-linux-2.6-x86_64.rpm \
    'https://www.splunk.com/bin/splunk/DownloadActivityServlet?architecture=x86_64&platform=linux&version=6.5.1&product=splunk&filename=splunk-6.5.1-f74036626f0c-linux-2.6-x86_64.rpm&wget=true'
    rpm -ivf /root/splunk-6.5.1-f74036626f0c-linux-2.6-x86_64.rpm
    su - splunk -c "splunk start --accept-license --answer-yes --auto-ports --no-prompt"
    EOF
}
