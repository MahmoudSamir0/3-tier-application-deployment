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
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.4 |
| <a name="requirement_docker"></a> [docker](#requirement\_docker) | >= 23.0.2 |

1. Terraform and Docker are [installed](#software-dependencies) on the machine where Terraform is executed.
### Software Dependencies
#### Terraform and Plugins
- [Terraform](https://www.terraform.io/downloads.html) 0.13+
- [terraform-0.13-upgrade](https://www.terraform.io/upgrade-guides/0-13.html)



You can verify that terraform is  installed in your local ,machine
this by running `terraform version`


```shell script
terraform version
```


#### Docker
- [docker](https://docs.docker.com/engine/install/)
## the three-tier architecture design

![architecture_design](https://github.com/MahmoudSamir0/3-tier-application-deployment/blob/master/demo-02/0%20EO6KqgSu4vA1I2rb.png)

## application
### presentation tier (webserver) — this is where the user interacts with the website
### application tier (app server) — this is where we have our business logics.

In other words, the `presentation tier` forwards requests from the user to the `app server`, that in turn runs queries on the `rds` instance to fetch the lesson recordings. Our database will be a relational database with a `MySQL` engine just like how YouTube stores videos.

##  simple app that returns “Hello World”.
### Dockerfile
```
# // Dockerfile

# Select node version and set working directory
FROM node:17-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app

RUN npm install

# Bundle app source
COPY . /usr/src/app

# Expose publc port and run npm command
EXPOSE 3000
CMD ["npm", "start"]

```
# Creating the infrastructure 
## Backend Configuration

A backend defines where Terraform stores its `state data files`

[demo-01](https://github.com/MahmoudSamir0/3-tier-application-deployment/tree/master/demo-01)

