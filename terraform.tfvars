budgets = [
  {
    name          = "Budget1"
    amount        = 1000
    time_grain    = "Monthly"
    start_date    = "2024-01-01T00:00:00Z"
    end_date      = "2024-12-31T23:59:59Z"
    notifications = [
      {
        enabled         = true
        threshold       = 90
        operator        = "GreaterThan"
        threshold_type  = "Actual"
        contact_emails  = ["user1@example.com"]
        contact_roles   = ["Owner"]
      }
    ]
  },
]

client_secret   = ""
client_id       = ""
tenant_id       = ""
