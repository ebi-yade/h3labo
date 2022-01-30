# Network-Compose

Docker-Compose Environment for Client-Server Network Experiments

# Tutorial

```shell
# build when needed
docker-compose build

# run containers in the background
docker-compose up -d

# send ping requests for 10 times without any delay
docker-compose exec client ping -c 10 server

# configure 100ms delay to the CLIENT container's outbound
docker-compose exec client tcset eth0 --delay 100ms

# try it again!
# => requests will be slower than the first time in 100ms on Avg.
docker-compose exec client ping -c 10 server

# configure 200ms delay to the SERVER container's outbound
docker-compose exec server tcset eth0 --delay 100ms

# once again!
# => requests will be slower than the first time in 300ms on Avg.
docker-compose exec client ping -c 10 server

# you can reset the configuration easily by restarting them
docker-compose down
dicker-compose up -d

# configure 10% packet loss to the SERVER container's outbound
docker-compose exec server tcset eth0 --loss 10%

# send ping requests for 50 times without any delay
# => 5 requests will be fail on Avg.
docker-compose exec client ping -c 50 server
```

_**Note:** configuring the same packet loss rate to both the server and the client does not double the loss rate. It
will just square the probability of life._

For more information, see:

- https://docs.docker.com/
- https://github.com/thombashi/tcconfig
