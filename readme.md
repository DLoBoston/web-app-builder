# Web App Builder (PHP/Node)

The purpose of the image created by this Dockerfile is to:

 1. Provide a means to spin up a quick development environment with minimal dependencies:
	 - Docker
	 - Git
 2. Provide a means to build complete web app images for deployment to test and production environments

## Instructions for Development Use

 1. Have Docker and Git installed.
 2. Create a working directory (for demonstrative purposes, let's call it /app) on your host machine.
 3. Git clone your applicable project into the working directory.
 4. Create an additional directory called /web-app-config within /app, populated with the necessary config files.
	 - This directory might contain an SQL dump, a vhost config, etc...
	 - This directory should be ignored in the /app git repo
	 - Other types of files pulled from a private repo or secure location.
 5. Run docker-compose up
	 - It is assumed that the /app repo has the appropriate docker-compose file referencing the web-app-builder image.
 6. Connect to the running web server and run necessary commands with CLI tools like composer, npm, artisan to build the app.
 7. Create a hosts file entry to view the running app in a browser.
 8. Develop/ write code as normal in the working directory of the host, committing valid updates to the repo.

## Instructions for Build Tool Use

 1. Use this image to build a running version of the web app you want to snapshot, and then create a single file archive of it.
	 - This can be done manually or with an automated tool like Jenkins.
 2. Then, using the production Dockerfile included with the /app repo, do a build importing (mounting) this file into a running container.
	- Include any other necessary configuration files.
 3. Commit/tag the running image. This is your all-inclusive image for deployments.
	- All-inclusive refers to the web-stack dependencies, not other required resources like databases, and other service dependencies.
