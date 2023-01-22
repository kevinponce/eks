# brew install jq

## Get iam user aws iam access key and id
```
terraform state pull | jq '.resources[] | select(.type == "aws_iam_access_key") | .instances[0].attributes'
```

```
brew install eksctl
arn=$(terraform state pull | jq '.resources[] | select(.type == "aws_iam_user") | .instances[0].attributes | .arn')
clusterName=$(terraform state pull | jq '.resources[] | select(.type == "aws_eks_cluster") | .instances[0].attributes.name')

eksctl get iamidentitymapping --cluster <cluster> --region=us-east-1
eksctl create iamidentitymapping --cluster <cluster> --arn <arn> --group system:masters --username ops-user
```

## Update github settings
* Go to your github repo
* Settings
* Expand Actions
* Click General
* Select `Read and write permissions` under `Workflow permissions`
* Click save
