# EC2

Provisions an EC2 instance with internet access and ssh configured

## SSH Config
In order to set up ssh with the your public key you can set the `public_key_file` variable with the path to your public key file

Alternatively you can use the defaults by copying your public key file to `terraform/data`

**Generate a key pair**
```
ssh-keygen -t rsa -b 4096 -f .ssh/ec2
```

**Copy public key to project data directory**
```
cp ~/.ssh/ec2.pub ./terraform/data/ec2.pub
```

**After terraform apply**
```
ssh ubuntu@<PUBLIC_IP> -i ~/.ssh/ec2
```