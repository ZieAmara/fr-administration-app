echo "Clear and restart containers"
sudo docker-compose kill
sudo docker rm api-container http-server-container maildev-container prometheus-container grafana-container rabbitmq-container database-container quarkus-container 
sudo docker-compose up --build -d