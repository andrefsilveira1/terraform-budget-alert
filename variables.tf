# variable "budgets" {
#   description = "List of Budgets"
#   type = list(object({
#     name          = string
#     amount        = number
#     time_grain    = string
#     start_date    = string
#     end_date      = string
#     notifications = list(object({
#         enabled = bool
#         threshold = number
#         operator = string
#         threshold_type = string
#         contact_emails = list(string)
#         contact_roles = list(string)
#     }))
#   }))
# }