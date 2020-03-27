## Install Azure CLI and login to your Azure
```bash
brew update && brew install azure-cli

az login
```
## Configure a blob storage as Terraform backend
./script/create_backend.sh

```bash
RESOURCE_GROUP_NAME=tstate
STORAGE_ACCOUNT_NAME=tstate$RANDOM
CONTAINER_NAME=tstate

az group create --name $RESOURCE_GROUP_NAME --location eastus

az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob


ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query [0].value -o tsv)

az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --account-key $ACCOUNT_KEY

echo "storage_account_name: $STORAGE_ACCOUNT_NAME"
echo "container_name: $CONTAINER_NAME"
echo "access_key: $ACCOUNT_KEY"
```

## Create an environment variable named ARM_ACCESS_KEY
```bash
export ARM_ACCESS_KEY=$ACCOUNT_KEY
```

## Setup backend section
```terraform
terraform {
  backend "azurerm" {
    resource_group_name  = "tstate"
    storage_account_name = "tstate20102"
    container_name       = "tstate"
    key                  = "terraform.tfstate"
  }
}
```

## Set up Terraform access to Azure
```bash
export SUBSCRIPTION_ID="your-subscription-id"
az account set --subscription="${SUBSCRIPTION_ID}"
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/${SUBSCRIPTION_ID}"
```

Your appId, password, sp_name, and tenant are returned. Make a note of the appId and password.

## Add those credentials to GitHub Action secrets
ARM_SUBSCRIPTION_ID=your_subscription_id
ARM_CLIENT_ID=your_appId
ARM_CLIENT_SECRET=your_password
ARM_TENANT_ID=your_tenant_id

## GitHub Action workflow for Terraform
