resource "azurerm_consumption_budget_subscription" "this" {
  for_each = {
    for budget in var.budgets : budget.name => budget
  }

  name            = each.value.name
  subscription_id = format("/subscriptions/%s", azurerm_subscription.this.subscription_id)

  amount     = each.value.amount
  time_grain = each.value.time_grain

  time_period {
    start_date = each.value.start_date
    end_date   = each.value.end_date
  }

  dynamic "filter" {
    for_each = lookup(each.value, "filter", null) != null ? [each.value.filter] : []
    content {
      dynamic "dimension" {
        for_each = lookup(filter.value, "dimensions", [])
        content {
          name   = dimensions.value.name
          values = dimensions.value.values
        }
      }

      dynamic "tag" {
        for_each = lookup(filter.value, "tags", [])
        content {
          name   = tags.value.name
          values = tags.value.values
        }
      }
    }
  }

  dynamic "notification" {
    for_each = {
      for notification in each.value.notifications : notification.name => notification
    }
    content {
      enabled        = notification.value.enabled
      threshold      = notification.value.threshold
      operator       = notification.value.operator
      threshold_type = notification.value.threshold_type
      contact_emails = notification.value.contact_emails
    }
  }

  timeouts {
    create = try(
      local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"]["create"],
      local.metadata.resource_timeouts["default"]["create"]
    )
    read = try(
      local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"]["read"],
      local.metadata.resource_timeouts["default"]["read"]
    )
    update = try(
      local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"]["update"],
      local.metadata.resource_timeouts["default"]["update"]
    )
    delete = try(
      local.metadata.resource_timeouts["azurerm_consumption_budget_subscription"]["delete"],
      local.metadata.resource_timeouts["default"]["delete"]
    )
  }
}