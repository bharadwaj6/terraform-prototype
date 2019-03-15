# Terraform Prototype

- Separated into environments such as prod, staging, UAT etc.
- Common config in main module for each environment.
- Dependent resources such as dbs, computes, networks in their own modules under each environment.
