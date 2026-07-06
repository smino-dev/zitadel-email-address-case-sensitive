## Starting
```sh
# First time only: Adjust .env as needed
# Uncomment the `DOCKER_SOCKET_PATH` env var if you use Podman.
cp .env.example .env

docker-compose up -d

cd terraform
terraform init
terraform apply -auto-approve
```

## Resetting
```sh
docker-compose down --volumes
rm ./terraform/terraform.tfstate
```

## Admin User
user name: `zitadel-admin@zitadel.localhost`
password: `Password1!`

## Example User
user name: `test@example.com`
password: `Password1!`
