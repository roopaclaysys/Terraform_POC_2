### INPUT VARs ###
variable "LOCATION" {}
variable "RESOURCE_GROUP" {}
variable "STORAGE_ACC_NAME" {}
variable "STORAGE_ACC_KEY" {}
variable "STORAGE_CONNECTION_STRING" {}

resource "azurerm_application_insights" "func_application_insights" {
  name                = "func-application-insights"
  location            = var.LOCATION
  resource_group_name = var.RESOURCE_GROUP
  application_type    = "Node.JS"
}

resource "azurerm_app_service_plan" "func_app_service_plan" {
  name                = "func-app-service-plan"
  location            = var.LOCATION
  resource_group_name = var.RESOURCE_GROUP
  kind                = "FunctionApp"
  reserved = true
  sku {
    tier = "Dynamic"
    size = "Y1"
  }

}

resource "azurerm_function_app" "func_function_app" {
  name                = "azfunc-app-terrf"
  location            = var.LOCATION
  resource_group_name = var.RESOURCE_GROUP
  app_service_plan_id = azurerm_app_service_plan.func_app_service_plan.id
   storage_account_name       = var.STORAGE_ACC_NAME
  storage_account_access_key = var.STORAGE_ACC_KEY


}
