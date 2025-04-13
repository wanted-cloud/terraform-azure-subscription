module "example" {
    source                 = "../.."
    billing_account_name   = "example-billing-account"
    subscription_name      = "example-subscription"
    billing_account_scope  = "MCA"
    billing_profile_name   = "example-billing-profile"
    invoice_section_name   = "example-invoice-section"
    
    budgets = [{
      name = "budget1"
      amount = 100
      time_grain = "Monthly"
      start_date = "2021-01-01T15:04:05Z"
      notifications = [{
            name = "notification1"
            operator = "GreaterThan"
            threshold = 90
        }]
    }]
}