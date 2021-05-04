terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "tkusuki-study"

    workspaces {
      name = "aws-tkusuki"
    }
  }
}
