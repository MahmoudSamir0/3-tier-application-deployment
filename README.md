# 3-tier application deployment on AWS using Terraform and Docker
## What is a 3 Tier Architecture

A 3 tier architecture consists of a presentation tier, an application tier, and a data tier. The presentation tier houses the user interface, such as the website that a user or client navigates to. It can also be thought of as the `front end` The application tier is where data is processed and is often called the `back end` The data tier is where data is stored and managed.
## Benefits of a 3 Tier Architecture
1.`Decreased development time` — different teams can work on different tiers simultaneously, resulting in decreased time to deploy

2.`Increased scalability` — a tier can have an auto-scaling group independent of other tiers, meaning for each tier, you only use what you need

3.`Increased reliability` — each tier can have multiple resources in multiple availability zones and the success and availability of one tier is 
independent of the other tiers

4.`Increased security` — each tier can have its own security group, allowing for custom permissions depending on the needs of that tier
## Requirements

1. Terraform and Docker are [installed](#software-dependencies) on the machine where Terraform is executed.
### Software Dependencies
#### Terraform and Plugins
- [Terraform](https://www.terraform.io/downloads.html) 0.13+
- [terraform-0.13-upgrade](https://www.terraform.io/upgrade-guides/0-13.html)
#### Docker
- [docker](https://docs.docker.com/engine/install/)
## the three-tier architecture design
![architecture_design](https://github.com/MahmoudSamir0/3-tier-application-deployment/blob/master/demo-02/0%20EO6KqgSu4vA1I2rb.png)
