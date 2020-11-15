resource "aws_s3_bucket" "terraform" {
  bucket = "kryz-remote-terraform-state-files"
  acl    = "private"

  tags = {
    Name        = "kryz-remote-terraform-state-files"
    Environment = "development"
  }
}
