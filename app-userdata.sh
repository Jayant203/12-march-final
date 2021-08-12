#!/bin/bash

packer build manifest11.json
#packer build -var "packagename=wordpress" manifest11.json
terraform init
terraform plan
terraform apply -input=false -auto-approve
