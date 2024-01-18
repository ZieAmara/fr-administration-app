
echo "\ncloning fr-application-http-server, fr-administration-front, fr-administration-api, fr-administration-quarkus\n"

clone_repo() {
    local repo_name="$1"
    local repo_url="$2"

    if [ ! -d "$repo_name" ]; then
        git clone "$repo_url"
    else
        echo "Directory $repo_name already exists."
    fi
}

clone_repo "fr-application-http-server" "https://github.com/ZieAmara/fr-application-http-server.git"
clone_repo "fr-administration-front" "https://github.com/ZieAmara/fr-administration-front.git"
clone_repo "fr-administration-api" "https://github.com/ZieAmara/fr-administration-api.git"
clone_repo "fr-administration-quarkus" "https://github.com/ZieAmara/fr-administration-quarkus.git"


echo "\nChecking Quarkus installation ..."
quarkus --version
if [ $? -eq 127 ]; then
    echo "Quarkus not installed :(. \nPlease install Quarkus first. You can use this link: https://quarkus.io/get-started/"
    exit 1
fi
echo "\nQuarkus is installed :)\n"


echo "Pulling Docker images..."
docker pull node:lts-alpine -q && echo "Node image downloaded"
docker pull mysql:latest -q && echo "MySQL image downloaded"
docker pull nginx:latest -q && echo "Nginx image downloaded"
docker pull rabbitmq:3.12-management -q && echo "RabbitMQ image downloaded"
docker pull maildev/maildev:latest -q && echo "MailDev image downloaded"
echo "\nDocker images downloaded\n"


cd fr-administration-quarkus
quarkus build
cd ..

sudo docker-compose up --build -d