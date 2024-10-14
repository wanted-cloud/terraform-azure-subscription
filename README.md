<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-subscription

Terraform building block for creation and management of Azure subscriptions.

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=3.113.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=3.113.0)

## Modules

No modules.

## Resources

The following resources are used by this module:

- [azurerm_consumption_budget_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription) (resource)
- [azurerm_management_group_subscription_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) (resource)
- [azurerm_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) (resource)
- [azurerm_billing_enrollment_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_enrollment_account_scope) (data source)
- [azurerm_billing_mca_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mca_account_scope) (data source)
- [azurerm_billing_mpa_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mpa_account_scope) (data source)

## Required Inputs

The following input variables are required:

### <a name="input_billing_account_name"></a> [billing\_account\_name](#input\_billing\_account\_name)

Description: The name of the billing account to associate with the subscription.

Type: `string`

### <a name="input_billing_account_scope"></a> [billing\_account\_scope](#input\_billing\_account\_scope)

Description: The scope of the billing account to associate with the subscription.

Type: `any`

### <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name)

Description: The name of the subscription.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_alias"></a> [alias](#input\_alias)

Description: The alias of the subscription.

Type: `string`

Default: `""`

### <a name="input_billing_profile_name"></a> [billing\_profile\_name](#input\_billing\_profile\_name)

Description: Name of the MCA billing profile.

Type: `string`

Default: `""`

### <a name="input_budgets"></a> [budgets](#input\_budgets)

Description: List of budgets to be assigned under subscription group.

Type:

```hcl
list(object({
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
```

Default: `[]`

### <a name="input_customer_name"></a> [customer\_name](#input\_customer\_name)

Description: Name of the MPA customer.

Type: `string`

Default: `""`

### <a name="input_enrollment_account_name"></a> [enrollment\_account\_name](#input\_enrollment\_account\_name)

Description: Name of the EA enrollment account.

Type: `string`

Default: `""`

### <a name="input_invoice_section_name"></a> [invoice\_section\_name](#input\_invoice\_section\_name)

Description: Name of the MCA invoice section.

Type: `string`

Default: `""`

### <a name="input_management_group_id"></a> [management\_group\_id](#input\_management\_group\_id)

Description: The ID of the management group to associate with the subscription.

Type: `string`

Default: `""`

### <a name="input_metadata"></a> [metadata](#input\_metadata)

Description: Module metadata object to give user possibility to override default module values.

Type:

```hcl
object({
    default_tags             = optional(map(string), {})
    resource_timeouts        = optional(map(map(string)), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The ID of the subscription.

Type: `string`

Default: `""`

### <a name="input_tags"></a> [tags](#input\_tags)

Description: Key value pairs of custom tags to be applied to the module resources.

Type: `map(string)`

Default: `{}`

### <a name="input_workload"></a> [workload](#input\_workload)

Description: The workload of the subscription.

Type: `string`

Default: `"Production"`

## Outputs

The following outputs are exported:

### <a name="output_azurerm_management_group_subscription_association"></a> [azurerm\_management\_group\_subscription\_association](#output\_azurerm\_management\_group\_subscription\_association)

Description: value of azurerm\_management\_group\_subscription\_association.this

### <a name="output_subscription"></a> [subscription](#output\_subscription)

Description: value of azurerm\_subscription.this

Created by WANTED.solutions s.r.o.
---
<sup><sub>_2024 &copy; All rights reserved - WANTED.solutions s.r.o. [<@wanted-solutions>](https://github.com/wanted-solutions)_</sub></sup>
<!-- END_TF_DOCS -->