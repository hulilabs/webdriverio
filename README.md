# Introduction
Docker image to easily run Selenium tests using [webdriverIO](http://webdriver.io/).

# Getting started

## Requirements
- [Docker](https://docs.docker.com/engine/installation/)

## Usage
To use this image to run your app tests you can add the following to a `docker-compose.yml` file:

```
version: '2'
services:
    webdriverio:
        image: huli/webdriverio:latest
        depends_on:
            - chrome
            - firefox
        volumes:
            - {{replace_with_path_of_wdio.conf.js_file}}:/app

    hub:
        image: selenium/hub
        ports:
            - 4444:4444

    firefox:
        image: selenium/node-firefox
        ports:
            - 5900
        environment:
            - HUB_PORT_4444_TCP_ADDR=hub
        depends_on:
            - hub

    chrome:
        image: selenium/node-chrome
        ports:
            - 5900
        environment:
            - HUB_PORT_4444_TCP_ADDR=hub
        depends_on:
            - hub
```

Then simply run:
```
docker-compose run --rm webdriverio wdio
```

## Configuration
This image comes with the following packages preinstalled:
- [Mocha](https://mochajs.org/)
- [Chai](http://chaijs.com/)
- [Sinon](http://sinonjs.org/)
- [Jasmine](http://jasmine.github.io/)
- [Cucumber](https://cucumber.io/)
