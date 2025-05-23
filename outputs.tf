output "subscription" {
  description = "value of azurerm_subscription.this"
  value       = azurerm_subscription.this
}

output "azurerm_management_group_subscription_association" {
  description = "value of azurerm_management_group_subscription_association.this"
  value       = azurerm_management_group_subscription_association.this
}

output "Subscription_consumption_budgets" {
  description = "value of azurerm_consumption_budget_subscription_group.this"
  value       = azurerm_consumption_budget_subscription.this
}