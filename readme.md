## Starting
```sh
# First time only: Adjust .env as needed
mv .env.example .env

docker-compose up -d

cd terraform
terraform init
terraform apply -auto-approve
```

## Admin User
user name: `zitadel-admin@zitadel.localhost`
password: `Password1!`
