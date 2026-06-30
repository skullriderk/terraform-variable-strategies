terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "terraformkkrbackend"
    container_name       = "tfstate"
    key                  = "terraform-tfvars-demo.tfstate"
  }
}