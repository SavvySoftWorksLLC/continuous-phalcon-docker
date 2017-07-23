# PHP Dockerized for PhalconPHP (SavvySoftWorks edition)

## What's inside

* [Nginx](http://nginx.org/)
* [MySQL](http://www.mysql.com/)
* [PHP-FPM](http://php-fpm.org/)
* [Memcached](http://memcached.org/)
* [Beanstalkd](https://www.rabbitmq.com/)

## Requirements

* [Docker Engine](https://docs.docker.com/installation/)
* [Docker Compose](https://docs.docker.com/compose/)
* [Docker Machine](https://docs.docker.com/machine/) (Mac and Windows only)

## Running

Set up a Docker Machine and then run:

- [Install Docker for macOS](https://docs.docker.com/docker-for-mac/)
- Navigate to the project folder and setup the containers

> Make sure that nothing is using port 80 first
```
netstat -an | grep "\.80" | grep LISTEN
```

```sh
$ docker-compose build
$ docker-compose create
$ docker-compose start
```

If you receive an error about networks or containers that don't exist do this
Wait until `MySQL init process done. Ready for start up.` happens before CTRL-C.

```sh
$ docker-compose up
$ docker-compose stop
$ docker-compose create
$ docker-compose start
```

From then on you can just run
```sh
docker-compose start
```
Or
```sh
$ docker-compose stop
```

## Deploy

### Automated
There is an automated deploy hook that can be copied or sym-linked to the deploy repo in `./bin/hooks/post-receive`.

### Manual
- Push your changes to the deployment remote
- SSH to the server and naviate to the `flexcore-enterprise` directory
- Navigate to `application/deploy`
- Pull from local repo with `git pull`
- run $`sudo docker-compose build deploy && sudo docker-compose create deploy && sudo docker-compose start deploy`
