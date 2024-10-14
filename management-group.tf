resource "azurerm_management_group_subscription_association" "this" {
  count               = var.management_group_id != "" ? 1 : 0
  management_group_id = var.management_group_id
  subscription_id     = azurerm_subscription.this.id

  timeouts {
    create = (
      (lookup(local.metadata.resource_timeouts, "azurerm_management_group_subscription_association", null) != null)
      ? (lookup(local.metadata.resource_timeouts["azurerm_management_group_subscription_association"], "create", null) != null)
      ? local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["create"]
      : local.metadata.resource_timeouts.default.create
      : local.metadata.resource_timeouts.default.create
    )
    read = (
      (lookup(local.metadata.resource_timeouts, "azurerm_management_group_subscription_association", null) != null)
      ? (lookup(local.metadata.resource_timeouts["azurerm_management_group_subscription_association"], "read", null) != null)
      ? local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["read"]
      : local.metadata.resource_timeouts.default.read
      : local.metadata.resource_timeouts.default.read
    )
    delete = (
      (lookup(local.metadata.resource_timeouts, "azurerm_management_group_subscription_association", null) != null)
      ? (lookup(local.metadata.resource_timeouts["azurerm_management_group_subscription_association"], "delete", null) != null)
      ? local.metadata.resource_timeouts["azurerm_management_group_subscription_association"]["delete"]
      : local.metadata.resource_timeouts.default.delete
      : local.metadata.resource_timeouts.default.delete
    )
  }
}