
provider "azurerm" {
  # Whilst version is optional, we /strongly recommend/ using it to pin the version of the Provider being used
  version         = "=1.28.0"
  subscription_id = "8ed78bfb-6bcf-4bc5-b192-8b60e0c955a2"
}
resource "azurerm_resource_group" "test" {
  name     = "${var.resource-group-name}"
  location = "${var.location}"
}

resource "azurerm_app_service_plan" "test" {
  name                = "tf-appserviceplan"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "test" {
  name                = "${var.app-service-name}"
  location            = "${azurerm_resource_group.test.location}"
  resource_group_name = "${azurerm_resource_group.test.name}"
  app_service_plan_id = "${azurerm_app_service_plan.test.id}"

  site_config {
    dotnet_framework_version = "v4.0"
    scm_type                 = "LocalGit"
  }

  app_settings = {
    "SOME_KEY" = "some-value"
  }
}
