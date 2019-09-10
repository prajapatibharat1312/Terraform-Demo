variable "resource-group-name" {
  default     = "dba-devenv-rg1"
  description = "The prefix used for all resources in this example"
}

variable "location" {
  default     = "East US"
  description = "The Azure location where all resources in this example should be created"
}

variable "app-service-name" {
  default     = "tf-app-service"
  description = "The name of the app service"
}
