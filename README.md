# Docker Multiple PHP Apps Example

This repository contains two hypothetical apps - admin and portal. Using the official [PHP Apache Docker image](https://hub.docker.com/_/php/), you can configure virtual hosts to map different (sub)domains to the respective application document roots.

## How to Use

1. Add the Dockerfile to your PHP project
2. Create a virtual-hosts.conf in your repository root directory. Specify the (sub)domains and document roots for each app.
3. If you need to set any PHP global overrides, create a php.ini in the repository root directory.

## Port Usage

This example project assumes you are using a reverse proxy such as HAProxy or Nginx, most likely listening on port 80/443. Therefore, the Apache virtual hosts are configured to listen on port 5000.

If you are not running Apache behind a reverse proxy, then update the virtual-hosts.conf with the appropriate port (80 or similar).

## Running Locally

For testing purposes:
```
docker build -t app .
docker run -d -p 5000:5000 app
curl -I http://admin.lvh.me:5000
curl -I http://portal.lvh.me:5000
```
