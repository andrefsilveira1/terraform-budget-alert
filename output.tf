output "budget_ids" {
  description = "Ids from budgets"
  value = {for b in azurerm_consumption_budget_subscription.budget : b.name => b.id}
}

output "budget_names" {
  description = "The names from budgets"
  value = [for b in azurerm_consumption_budget_subscription.budget : b.name]
}