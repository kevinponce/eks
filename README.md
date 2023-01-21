# brew install jq

## Get iam user aws iam access key and id
```
terraform state pull | jq '.resources[] | select(.type == "aws_iam_access_key") | .instances[0].attributes'
```

## Update github settings
* Go to your github repo
* Settings
* Expand Actions
* Click General
* Select `Read and write permissions` under `Workflow permissions`
* Click save
