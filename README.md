# Introduction
Docker image to easily run Selenium tests using [webdriverIO](http://webdriver.io/).

![WebdriverIO](http://webdriver.io/images/webdriverio.png)

# Getting started

## Requirements
- [Docker](https://docs.docker.com/engine/installation/)

## Usage
To use this image to run your app tests you can add the following to a `docker-compose.yml` file:

[basic version](webdriverio/basiccompose.txt)
or 
[vnc version](webdriverio/vnccompose.txt)

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
3. Command 'docker logs containername' will tell you if you have any issues with your grid.
4. Remove old versions of selenium dockers (it was messing with my installation).

