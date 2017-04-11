# Introduction
Docker image to easily run Selenium tests using [webdriverIO](http://webdriver.io/).

![WebdriverIO](http://webdriver.io/images/webdriverio.png)

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
            - hub
        environment:
            - HUB_PORT_4444_TCP_ADDR=hub
            - HUB_PORT_4444_TCP_PORT=4444
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
            - HUB_PORT_4444_TCP_PORT=4444
        depends_on:
            - hub

    chrome:
        image: selenium/node-chrome
        ports:
            - 5900
        environment:
            - HUB_PORT_4444_TCP_ADDR=hub
            - HUB_PORT_4444_TCP_PORT=4444
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

## Troubleshooting

**ERROR: Error forwarding the new session Empty pool of VM for setup Capabilities**

Sometimes the browsers might not have enough time to connect to the hub. You can either:
1. Make it in two steps: first run `docker-compose up -d chrome firefox hub` then `docker-compose run --rm webdriverio wdio`
2. Or you can add a sleep time to make sure the hub is ready: `docker-compose run --rm webdriverio bash -c "sleep 10 && wdio"`.

