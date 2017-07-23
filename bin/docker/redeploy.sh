#!/bin/sh

# requires sudo
sudo docker-compose build deploy && \
sudo docker-compose create deploy && \
sudo docker-compose start deploy
