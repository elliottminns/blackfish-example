# Blackfish Example

This is an example project for the [Blackfish](https://github.com/elliottminns/blackfish) web server.

It is currently configured to run on Heroku and Docker

### Docker
This example application is equipped with a Docker configuration file. It allows to run the application locally in an Ubuntu based Linux environment.

1. Install [Docker](https://www.docker.com) on your machine
2. Launch the [Docker Quickstart Terminal app](https://docs.docker.com/mac/step_one/) or manually start the default Docker machine: `docker-machine start default`
3. `cd` into `blackfish-example`
4. Build the image: `docker build -t blackfish .`
5. Configure VirtualBox to [forward port 4000 to 4000](https://www.virtualbox.org/manual/ch06.html#natforward)
6. Launch the container: `docker run -it -p 4000:4000 blackfish`
7. Point your browser to [http://localhost:4000](http://localhost:4000)
