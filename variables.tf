variable "subscription_name" {
  description = "The name of the subscription."
  type        = string

}

variable "subscription_id" {
  description = "The ID of the subscription."
  type        = string
  default     = ""
}

variable "alias" {
  description = "The alias of the subscription."
  type        = string
  default     = ""
}

variable "workload" {
  description = "The workload of the subscription."
  type        = string
  default     = "Production"
}

variable "management_group_id" {
  description = "The ID of the management group to associate with the subscription."
  type        = string
  default     = ""
}

variable "billing_account_name" {
  description = "The name of the billing account to associate with the subscription."
  type        = string
  default     = ""
}

variable "billing_account_scope" {
  description = "The scope of the billing account to associate with the subscription."
  type        = string
  default     = "MCA"
}

variable "tags" {
  description = "A map of tags to assign to the subscription."
  type        = map(string)
  default     = {}
}

variable "enrollment_account_name" {
  description = "Name of the EA enrollment account."
  default     = ""
}

variable "billing_profile_name" {
  description = "Name of the MCA billing profile."
  default     = ""
}

variable "invoice_section_name" {
  description = "Name of the MCA invoice section."
  default     = ""
}

variable "customer_name" {
  description = "Name of the MPA customer."
  default     = ""
}

variable "budgets" {
  default     = []
  description = "List of budgets to be assigned under created resource group."
  type = list(
    object({
      name       = string
      amount     = number
      time_grain = optional(string)
      start_date = string
      end_date   = optional(string)
      filter = optional(object({
        dimensions = list(object({
          name   = string
          values = list(string)
        }))
        tags = list(object({
          name   = string
          values = list(string)
        }))
      }), null)
      notifications = list(object({
        contact_emails = optional(list(string))
        contact_groups = optional(list(string))
        contact_roles  = optional(list(string))
        enabled        = optional(bool, true)
        name           = string
        threshold      = number
        operator       = string
        threshold_type = optional(string)
      }))
    })
  )

  validation {
    condition = alltrue([
      for budget in var.budgets :
      budget.time_grain != null ? can(
        regex(
          local.metadata.validator_expressions["azurerm_consumption_budget_resource_group_time_grain"],
          budget.time_grain
        )
      ) : true
    ])
    error_message = local.metadata.validator_error_messages["azurerm_consumption_budget_resource_group_time_grain"]
  }
}