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
        enabled         = notification.value.enabled
        threshold       = notification.value.threshold
        operator        = notification.value.operator
        threshold_type  = notification.value.threshold_type
        contact_emails  = notification.value.contact_emails
        contact_roles   = notification.value.contact_roles
      }
    }
}

# Novos recursos:

resource "azurerm_monitor_diagnostic_setting" "example" {
  name               = "example"
  target_resource_id = azurerm_storage_account.example.id # substituir id

  enabled_log {
    category = "AuditEvent"

    retention_policy { # Analisar depreciação de retention policy
      enabled = false
    }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = false
    }
  }
}

resource "azurerm_monitor_metric_alert" "metric_alert" {
  name                = "metric_alert"
  resource_group_name = azurerm_resource_group.metric_alert.name
  scopes              = [azurerm_virtual_machine.metric_alert.id]
  description         = "Metric alerts when got 80% of CPU usage"
  enabled             = true

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 80
  }

  action {
    action_group_id = azurerm_monitor_action_group.metric_alert.id
  }
}
