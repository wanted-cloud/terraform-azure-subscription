data "azurerm_billing_enrollment_account_scope" "this" {
  count = var.billing_account_scope == "EA" ? 1 : 0

  billing_account_name    = var.billing_account_name
  enrollment_account_name = var.enrollment_account_name
}

data "azurerm_billing_mca_account_scope" "this" {
  count = var.billing_account_scope == "MCA" ? 1 : 0

  billing_account_name = var.billing_account_name
  billing_profile_name = var.billing_profile_name
  invoice_section_name = var.invoice_section_name
}

data "azurerm_billing_mpa_account_scope" "this" {
  count = var.billing_account_scope == "MPA" ? 1 : 0

  billing_account_name = var.billing_account_name
  customer_name        = var.customer_name
}