
# Clone repositories 
echo "\ncloning fr-application-http-server, fr-administration-front, fr-administration-api, fr-administration-quarkus\n"

## Clone repository function
clone_repo() {
    local repo_name="$1"
    local repo_url="$2"

    if [ ! -d "$repo_name" ]; then
        git clone "$repo_url"
    else
        echo "Directory $repo_name already exists."
    fi
}

## Clone repositories
clone_repo "fr-application-http-server" "https://github.com/ZieAmara/fr-application-http-server.git"
clone_repo "fr-administration-front" "https://github.com/ZieAmara/fr-administration-front.git"
clone_repo "fr-administration-api" "https://github.com/ZieAmara/fr-administration-api.git"
clone_repo "fr-administration-quarkus" "https://github.com/ZieAmara/fr-administration-quarkus.git"


# Pull Docker images
echo "Pulling Docker images..."
docker pull node:lts-alpine -q && echo "Node image downloaded"
docker pull mysql:latest -q && echo "MySQL image downloaded"
docker pull nginx:latest -q && echo "Nginx image downloaded"
docker pull rabbitmq:3.12-management -q && echo "RabbitMQ image downloaded"
docker pull maildev/maildev:latest -q && echo "MailDev image downloaded"
echo "\nDocker images downloaded\n"

# Start containers
sudo docker-compose up --build -d