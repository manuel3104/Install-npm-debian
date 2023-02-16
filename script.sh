
sudo apt install curl -y

curl -fsSL https://get.docker.com -o get-docker.sh

sudo bash get-docker.sh
sudo mkdir /home/nginx

cd /home/nginx

echo "version: '3'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt" > /home/nginx/docker-compose.yml

docker compose up -d
