# Introduction
Docker image to easily run Selenium tests using [webdriverIO](http://webdriver.io/).

![WebdriverIO](http://webdriver.io/images/webdriverio.png)

# Getting started

## Requirements
- [Docker](https://docs.docker.com/engine/installation/)

## Usage
Best way to start is clone this repository, go to app/test/specs - you will put your tests there.

Modify your wdio.conf.js file according to this:
[fix your wdio](how_to_change_wdio_conf_file.md)

Use "dot" version of reporter (others are not installed, at least for now). 

To use this image to run your app tests you can add the following to a `docker-compose.yml` file:

[basic version](basiccompose.yml)
or 
[vnc version](vnccompose.yml)

https://www.realvnc.com/download/viewer/linux/

pass : secret

IP - to be determined, now they are:
0.0.0.0:32803
0.0.0.0:32802

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

