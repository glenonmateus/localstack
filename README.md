# localstack

## required

- [docker](https://docs.docker.com/compose/install/)
- [docker compose](https://docs.docker.com/compose/install/)(version 1.9.0+)
- [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [localstack](https://docs.localstack.cloud/getting-started/installation/)

[terraform + localstack](https://docs.localstack.cloud/user-guide/integrations/terraform/)

```shell
aws configure --profile localstack
AWS Access Key ID [****************este]: teste
AWS Secret Access Key [****************este]: teste
Default region name [sa-east-1]: us-east-1
Default output format [None]:
```

Start localstack

```shell
docker compose up
```

Run terraform

```shell
terraform plan
terraform apply -auto-approve
terraform destroy -auto-approve
```

Command samples localstack:

```shell
aws --profile localstack --endpoint-url http://localhost:4566 s3api list-buckets
aws --profile localstack --endpoint-url http://localhost:4566 dynamodb list-tables
aws --profile localstack --endpoint-url http://localhost:4566 ec2 describe-instances
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
aws --profile localstack s3api list-buckets
aws --profile localstack dynamodb list-tables
aws --profile localstack ec2 describe-instances
```

## test

Configure dependencies

```shell
cd test
go mod init "<MODULE_NAME>"
go mod tidy
```

Where `<MODULE_NAME>` is the name of your module, typically in the format
`github.com/<YOUR_USERNAME>/<YOUR_REPO_NAME>`.

To run the tests:

```shell
cd test
go test -v
```
