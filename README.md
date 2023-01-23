# brew install jq

## Get iam user aws iam access key and id
```
terraform state pull | jq '.resources[] | select(.type == "aws_iam_access_key") | .instances[0].attributes'
```

* Go to Github rep settings
* Click Secrets and variables
* Select Secrets
* Add `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` from above

* Go to Github rep settings
* Click Secrets and variables
* Select Variables
* Add `ECR_REPOSITORY`, `EKS_NAME`, and `AWS_REGION` from `terraform plan` output

## Give Iam Permission to access eks
```
brew install eksctl
arn=$(terraform state pull | jq '.resources[] | select(.type == "aws_iam_user") | .instances[0].attributes | .arn')
clusterName=$(terraform state pull | jq '.resources[] | select(.type == "aws_eks_cluster") | .instances[0].attributes.name')

eksctl get iamidentitymapping --cluster <cluster> --region=us-east-1
eksctl create iamidentitymapping --cluster <cluster> --arn <arn> --group system:masters --username ops-user
```

## Update github settings to allow enviroments to be updated
* Go to your github repo
* Settings
* Expand Actions
* Click General
* Select `Read and write permissions` under `Workflow permissions`
* Click save
