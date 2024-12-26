variables {
  sg = "sg-0123456789"
  subnet = "subnet-0123456789"
}

run "valid_ec2_id" {

  assert {
    condition     = startswith(aws_instance.basic.id, "i-")
    error_message = "EC2 instance ID couldn't be assigned"
  }

}

run "valid_ec2_arn" {

  assert {
    condition     = startswith(aws_instance.basic.arn, "arn:aws:ec2:us-west-2")
    error_message = "EC2 instance ARN couldn't be assigned"
  }

}


run "valid_ec2_public_ip" {

  assert {
    condition     = length(aws_instance.basic.public_ip) <= 15
    error_message = "EC2 instance public IP address couldn't be assigned"
  }

}