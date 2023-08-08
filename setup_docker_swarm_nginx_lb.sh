############ Install Docker ######################################################
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo usermod -aG docker $USER
############## Docker Swarm #####################################################

sudo docker swarm init

#Backend:

sudo docker build --tag backend/app-node ./backend/app-node/
sudo docker build --tag backend/nginx ./backend/nginx/
sudo docker service create --name backend-app-node-swarm -p 80:5000 --replicas 2 backend/app-node

#Frontend: 

sudo docker build --tag frontend/app-node ./frontend/app-node/
sudo docker build --tag frontend/nginx ./frontend/nginx/
sudo docker service create --name frontend-app-node-swarm -p 81:3000 --replicas 2 frontend/app-node

sudo docker service ls


