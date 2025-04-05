<!-- BEGIN_TF_DOCS -->
# wanted-cloud/terraform-azure-subscription

Terraform building block for creation and management of Azure subscriptions.

## Table of contents

- [Requirements](#requirements)
- [Providers](#providers)
- [Variables](#inputs)
- [Outputs](#outputs)
- [Resources](#resources)
- [Usage](#usage)
- [Contributing](#contributing)

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (>= 1.9)

- <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) (>=3.113.0)

## Providers

The following providers are used by this module:

- <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) (>=3.113.0)

## Required Inputs

The following input variables are required:

### <a name="input_subscription_name"></a> [subscription\_name](#input\_subscription\_name)

Description: The name of the subscription.

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_alias"></a> [alias](#input\_alias)

Description: The alias of the subscription.

Type: `string`

Default: `""`

### <a name="input_billing_account_name"></a> [billing\_account\_name](#input\_billing\_account\_name)

Description: The name of the billing account to associate with the subscription.

Type: `string`

Default: `""`

### <a name="input_billing_account_scope"></a> [billing\_account\_scope](#input\_billing\_account\_scope)

Description: The scope of the billing account to associate with the subscription.

Type: `string`

Default: `"MCA"`

### <a name="input_billing_profile_name"></a> [billing\_profile\_name](#input\_billing\_profile\_name)

Description: Name of the MCA billing profile.

Type: `string`

Default: `""`

### <a name="input_budgets"></a> [budgets](#input\_budgets)

Description: List of budgets to be assigned under created resource group.

Type:

```hcl
list(
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

Description: Metadata definitions for the module, this is optional construct allowing override of the module defaults defintions of validation expressions, error messages, resource timeouts and default tags.

Type:

```hcl
object({
    resource_timeouts = optional(
      map(
        object({
          create = optional(string, "30m")
          read   = optional(string, "5m")
          update = optional(string, "30m")
          delete = optional(string, "30m")
        })
      ), {}
    )
    tags                     = optional(map(string), {})
    validator_error_messages = optional(map(string), {})
    validator_expressions    = optional(map(string), {})
  })
```

Default: `{}`

### <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id)

Description: The ID of the subscription.

Type: `string`

Default: `""`

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

## Resources

The following resources are used by this module:

- [azurerm_consumption_budget_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/consumption_budget_subscription) (resource)
- [azurerm_management_group_subscription_association.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/management_group_subscription_association) (resource)
- [azurerm_subscription.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subscription) (resource)
- [azurerm_billing_enrollment_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_enrollment_account_scope) (data source)
- [azurerm_billing_mca_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mca_account_scope) (data source)
- [azurerm_billing_mpa_account_scope.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/billing_mpa_account_scope) (data source)

## Usage

> For more detailed examples navigate to `examples` folder of this repository.

Module was also published via Terraform Registry and can be used as a module from the registry.

```hcl
module "example" {
  source  = "wanted-cloud/resource-group/azure"
  version = "x.y.z"
}
```

### Basic usage example

The minimal usage for the module is as follows:

```hcl
module "example" {
    source                 = "../.."
    billing_account_name   = "example-billing-account"
    subscription_name      = "example-subscription"
    subscription_id        = "0fadbcd6-340e-446c-a047-8614f414dbc5"
    billing_account_scope  = "MCA"
}
```
## Contributing

_Contributions are welcomed and must follow [Code of Conduct](https://github.com/wanted-cloud/.github?tab=coc-ov-file) and common [Contributions guidelines](https://github.com/wanted-cloud/.github/blob/main/docs/CONTRIBUTING.md)._

> If you'd like to report security issue please follow [security guidelines](https://github.com/wanted-cloud/.github?tab=security-ov-file).
---
<sup><sub>_2025 &copy; All rights reserved - WANTED.solutions s.r.o._</sub></sup>
<!-- END_TF_DOCS -->