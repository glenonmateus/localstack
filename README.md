# localstack

## required

- [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
- [localstack](https://docs.localstack.cloud/getting-started/installation/)

[terraform + localstack](https://docs.localstack.cloud/user-guide/integrations/terraform/)

```bash
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
```

```bash
tflocal plan
tflocal apply -auto-approve
```

```bash
$ aws configure --profile localstack
AWS Access Key ID [****************este]: teste
AWS Secret Access Key [****************este]: teste
Default region name [sa-east-1]: sa-east-1
Default output format [None]:

$ aws s3api list-buckets --profile localstack --endpoint-url http://localhost:4566
$ aws dynamodb list-tables --profile localstack --endpoint-url http://localhost:4566
```

