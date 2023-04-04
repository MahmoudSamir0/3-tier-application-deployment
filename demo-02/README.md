# demo-02
## overview
### firewall(waf)
#### rules
| Name | Description |
|------|---------|
| <a name="rules_AWSManagedRulesCommonRuleSet"></a> [AWSManagedRulesCommonRuleSet](#rules\_AWSManagedRulesCommonRuleSet) | General rules, including those listed in OWASP, CVE, etc. |
| <a name="rules_AWSRateBasedRuleDomesticDOS"></a> [AWSRateBasedRuleDomesticDOS](#rules\_AWSRateBasedRuleDomesticDOS) | prevent DOS from domestic |
| <a name="rules_AWSRateBasedRuleGlobalDOS"></a> [AWSRateBasedRuleGlobalDOS](#rules\_AWSRateBasedRuleGlobalDOS) | prevent DOS from global |


### Initialize the directory

When you create a new configuration — or check out an existing configuration
from version control — you need to initialize the directory with `terraform
init`. This step downloads the providers defined in the configuration.

Initialize the directory.

```shell script
terraform init
```
### Apply Configuration

 **copy this command**

```shell script
terraform apply 
```
# congratulations your app is ready 
## now now open app url (www.app.com) 
# Notes:
Be careful of Rout53 domain = 12$ for 12 month for domain
 
