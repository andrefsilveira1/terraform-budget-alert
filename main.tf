data "azurerm_subscription" "subscription" {}

resource "azurerm_consumption_budget_subscription" "budget" {
    for_each = { for b in var.budgets : b.name => b }

    name               = each.value.name
    amount             = each.value.amount
    time_grain         = each.value.time_grain
    subscription_id    = data.azurerm_subscription.subscription.id 

    time_period {
      start_date = each.value.start_date
      end_date = each.value.end_date
    }

    dynamic "notification" {
      for_each = each.value.notifications
      content {
        enabled = notification.value.enabled
        threshold = notification.value.threshold
        operator = notification.value.operator
        threshold_type = notification.value.threshold_type
        contact_emails = notification.value.contact_emails
        contact_roles = notification.value.contact_roles
      }
    }
}