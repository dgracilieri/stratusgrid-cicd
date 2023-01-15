variable "account_numbers" {
  description = "Whitelisted account numbers to apply terraform code in. Can apply in any if left blank."
  type    = list(string)
  default = []
}

variable "region" {
  description = "AWS Region to target"
  type        = string
  default     = "us-east-1"
}


variable "aws_profile" {
  description = "AWS Profile credentials to use"
  type        = string
  default     = "default"
}

variable "name_prefix" {
  description = "String to use as prefix on object names"
  type        = string
  default = "tf_s3_cicd"
}

variable "prepend_name_suffix" {
  description = "String to prepend to the name_suffix used on object names. This is optional, so start with dash if using like so: -mysuffix. This will result in prefix-objectname-mysuffix-env"
  type        = string
  default     = ""
}

variable "append_name_suffix" {
  description = "String to append to the name_suffix used on object names. This is optional, so start with dash if using like so: -mysuffix. This will result in prefix-objectname-env-mysuffix"
  type        = string
  default     = ""
}

variable "override_name_suffix" {
  description = "String to completely override the name_suffix"
  type        = string
  default     = ""
}

variable "env_name" {
  description = "Environment name string to be used for decisions and name generation. Appended to name_suffix to create full_suffix"
  type        = string
  default = "dev"
}

variable "source_repo" {
  description = "name of repo which holds this code"
  type        = string
  default = "github.com/dgracilieri/stratusgrid-cicd"
}

variable "developer" {
  description = "name of developer who has written this code"
  type        = string
  default     = "diego-gracilieri"
}


variable "s3-bucket-name" {
    description = "name bucket s3"
    type     = string
    default  = "tf-stratusgrid-cicd"
  
}

variable "dockerhub" {
    description = "credential docker hub"
    type     = string
    default  = "arn:aws:secretsmanager:us-east-1:552021011330:secret:codebulid/dockerhub-lx99G6"
  
}

variable "connector" {
    description = "connector to github"
    type     = string
    default  = "arn:aws:codestar-connections:us-east-1:552021011330:connection/b17b1e06-74c8-4fba-9aff-384698edfdeb"
  
}
