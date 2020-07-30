# TSS DevOps

A zero-downtime rolling-updatable (VPC/VNet based) infrastructure as code scripts supporting a simple PHP service on one or more autoscaled VM instances behind load balancer.

## AWS

Run the following command to create your Cloudformation stack.

```bash
CFN_NAME=my-aws-cfn-stackname
KEYNAME="YOUR_SSH_KEYNAME"  # <= Replace with your SSH Keyname
aws cloudformation create-stack --stack-name $CFN_NAME \
  --template-body=file://$PWD/aws/cloudformation.yml \
  --parameter ParameterKey=KeyName,ParameterValue=$KEYNAME
```
See [the template](./aws/cloudformation.yml) for other parameters.

## Azure

Run the following command to create a new Azure resource group and deploy your resources.

```bash
ARM_NAME=my_arm_group_name
ARM_LOCATION=eastus
az group create --name $ARM_NAME --location $ARM_LOCATION 
az deployment group create --resource-group $ARM_NAME  \
  --template-file ./azure/arm.json \
  --parameters ./arm.parameters.json
```
See [the template](./azure/arm.json) for other parameters.
