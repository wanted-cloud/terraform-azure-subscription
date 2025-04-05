module "example" {
    source                 = "../.."
    billing_account_name   = "example-billing-account"
    subscription_name      = "example-subscription"
    subscription_id        = "0fadbcd6-340e-446c-a047-8614f414dbc5"
    billing_account_scope  = "MCA"
}