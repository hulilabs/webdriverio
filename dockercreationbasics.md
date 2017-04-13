In Dockerfile you define what base image you start with (for example ubuntu / node / alpine).

In package.json you add npm packages you need.

Being in folder with dockerfile - run
(sudo) docker build -t newdockername .

DockerCompose.yaml gives you relations between your dockers. 
