variable "resourcegroup" {
  type = string
  default = "RG-Ghan-Dev-Global-001"
}

variable "location" {
    type = string
    default = "West Europe"
}

variable "azservbus" {
  type = string
  default = "sb-ghan-maha-global-001"
}

variable "azservbustopic" {
  type = string
  default = "testing"
}