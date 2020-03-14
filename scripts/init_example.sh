#!/bin/sh
echo "Setting environment variables for Terraform"
export ARM_SUBSCRIPTION_ID=<subscription_id>
export ARM_CLIENT_ID=<client_id>
export ARM_CLIENT_SECRET=<client_secret>
export ARM_TENANT_ID=<tenant_id>

# Not needed for public, required for usgovernment, german, china
export ARM_ENVIRONMENT=public