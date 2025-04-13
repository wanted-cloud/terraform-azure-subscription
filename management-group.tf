resource "azurerm_management_group_subscription_association" "this" {
  count               = var.management_group_id != "" ? 1 : 0
  management_group_id = var.management_group_id != "" ? length(split("/", var.management_group_id)) == 1 ? format("/providers/Microsoft.Management/managementGroups/%s", var.management_group_id) : var.management_group_id : null
  subscription_id     = azurerm_subscription.this.id

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}