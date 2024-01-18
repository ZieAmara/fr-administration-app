quarkus --version
if [ $? -eq 127 ]; then
    echo "Quarkus not installed. Please install Quarkus first. You can use this link: https://quarkus.io/get-started/"
    exit 1
fi
cd fr-administration-quarkus
quarkus build
cd ..
sudo docker-compose up --build -d