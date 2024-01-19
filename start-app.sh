
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
echo "\nPulling Docker images...\n"

echo "Downloading Node image..." && docker pull node:lts-alpine -q 
echo "Downloading MySQL image..." && docker pull mysql:latest -q 
echo "Downloading Nginx image..." && docker pull nginx:latest -q 
echo "Downloading RabbitMQ image..." && docker pull rabbitmq:3.12-management -q 
echo "Downloading MailDev image..." && docker pull maildev/maildev:latest -q 
echo "Downloading Prometheus image..." && docker pull prom/prometheus:latest -q 
echo "Downloading Grafana image..." && docker pull grafana/grafana:latest -q
echo "\nDocker images downloaded\n"

# Start containers
sudo docker-compose up --build -d

echo "\nContainers started\n\n* Click on http://localhost:80/front to access the application frontend\n\n* Click on http://localhost:80/api if your goal is to see the API endpoints or interact with it\n\n* Click on http://localhost:1080/#/ to access the mail server for sees the mail send to the users with the application frontend\n\n"