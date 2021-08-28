# Run the below
brew install --cask docker virtualbox
brew install docker-machine
docker-machine create default

#To have launchd start docker-machine now and restart at login:
  brew services start docker-machine
#Or, if you don't want/need a background service you can just run:
  docker-machine start

# To restart docker daemon
docker-machine restart

eval "$(docker-machine env default)" # This might throw an TSI connection error. In that case run docker-machine regenerate-certs default
(docker-machine restart) # maybe needed
docker run hello-world

# Run this command to configure your shell: 
eval $(docker-machine env)

# On Mac, docker desktop
docker run --name repo alpine/git clone https://github.com/docker/getting-started.git
docker cp repo:/git/getting-started/ .
docker build -t docker101tutorial .
docker run -d -p 80:80 --name docker-tutorial docker101tutorial
docker tag docker101tutorial anukcs/docker101tutorial
docker push anukcs/docker101tutorial
