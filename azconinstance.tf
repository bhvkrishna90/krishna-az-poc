resource "azurerm_resource_group" "jenkins-rg" {
  name     = "jenkins-test"
  location = "west us"
}

resource "azurerm_container_group" "jenkinscg" {
  name                = "jenkins"
  location            = "${azurerm_resource_group.jenkins-rg.location}"
  resource_group_name = "${azurerm_resource_group.jenkins-rg.name}"
  ip_address_type     = "public"
  dns_name_label      = "jenkinscgip"
  os_type             = "Linux"

  container {
    name   = "jenkins"
    image  = "bhvkrishna/jenkins-az:latest"
    cpu    = "1"
    memory = "1.5"
    port   = "8080"
    environment_variables {    }
    secure_environment_variables {     }
    commands = []
    }
    tags {
    environment = "testing"
    }
  }

  
