data "azurerm_management_group" "example" {
  display_name = "Tenant Root Group"
}

module "example" {
    source                 = "../.."
    billing_account_name   = "example-billing-account"
    subscription_name      = "example-subscription"
    billing_account_scope  = "MCA"
    billing_profile_name   = "example-billing-profile"
    invoice_section_name   = "example-invoice-section"
    management_group_id    = data.azurerm_management_group.example.id
}