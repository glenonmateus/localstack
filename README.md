# localstack

## required

- [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [localstack](https://docs.localstack.cloud/getting-started/installation/)

[terraform + localstack](https://docs.localstack.cloud/user-guide/integrations/terraform/)

```shell
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```

```shell
$ aws configure --profile localstack
AWS Access Key ID [****************este]: teste
AWS Secret Access Key [****************este]: teste
Default region name [sa-east-1]: us-east-1
Default output format [None]:

$ aws s3api list-buckets --profile localstack --endpoint-url http://localhost:4566
$ aws dynamodb list-tables --profile localstack --endpoint-url http://localhost:4566
```

Optional: Add endpoint_url in localstack profile

```shell
$EDITOR ~/.aws/config

[profile localstack]
region=us-east-1
output=json
endpoint_url=http://localhost:4566
```

```shell
aws s3api list-buckets --profile localstack
aws dynamodb list-tables --profile localstack
```

## test

Configure dependencies

```bash
cd test
go mod init "<MODULE_NAME>"
go mod tidy
```

Where `<MODULE_NAME>` is the name of your module, typically in the format
`github.com/<YOUR_USERNAME>/<YOUR_REPO_NAME>`.

To run the tests:

```bash
cd test
go test -v
```
