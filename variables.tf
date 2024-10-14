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
}

variable "billing_account_scope" {
  description = "The scope of the billing account to associate with the subscription."
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
  description = "List of budgets to be assigned under subscription group."
  type = list(object({
    name       = string
    amount     = number
    time_grain = string
    start_date = string
    end_date   = string
    filter = object({
      dimension = list(object({
        name   = string
        values = list(string)
      }))
      tag = list(object({
        name   = string
        values = list(string)
      }))
    })
    notifications = list(object({
      enabled        = bool
      threshold      = number
      operator       = string
      threshold_type = string
      contact_emails = list(string)
    }))
  }))
  default = []
}