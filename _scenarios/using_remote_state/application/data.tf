data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "kryz-remote-terraform-state-files"
    key    = "networking.tf"
    region = "eu-central-1"
  }
}
