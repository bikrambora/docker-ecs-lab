# A Static Site using Docker and Nginx

This repo contains code for building a simple static website served using an Nginx container inside Docker. The code for the site is contained in `index.html`, and the Nginx config is in `default.conf`. The Dockerfile contains commands to build a Docker Image.

To build a Docker image from the Dockerfile, run the following command from inside this directory

```sh
$ docker build -t <docker-hub-username>/staticsite:1.0 .
```
This will produce the following output

```sh
Sending build context to Docker daemon 81.41 kB
Step 1/3 : FROM nginx:alpine
 ---> 2f3c6710d8f2
Step 2/3 : COPY default.conf /etc/nginx/conf.d/default.conf
 ---> Using cache
 ---> 176c56cc07b6
Step 3/3 : COPY index.html /usr/share/nginx/html/index.html
 ---> 3407953dafd0
Removing intermediate container cb64bb3e3aca
Successfully built 3407953dafd0
```

To run the image in a Docker container, use the following command
```sh
$ docker run -itd --name mycontainer --publish 8080:80 <docker-hub-username>/staticsite:1.0
```

This will start serving the static site on port 8080. If you visit `http://localhost:8080` in your browser, you should be able to see our static site!