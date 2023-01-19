# brew install jq

## Get iam user aws iam access key and id
```
terraform state pull | jq '.resources[] | select(.type == "aws_iam_access_key") | .instances[0].attributes'
```

