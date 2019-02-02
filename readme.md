# Web App Builder (PHP/Node)

The purpose of the image created by this Dockerfile is to:

 1. Provide a means to spin up a quick development/build environment with minimal dependencies:
	 - Docker
	 - Git

## Instructions for Development Use

 1. Install Docker and Git.
 2. Create a working directory (for demonstrative purposes, let's call it /app) on your host machine.
 3. Git clone your applicable project into /app.
 4. Create an additional directory called /web-app-config within /app, populated with the necessary config files.
	 - This directory might contain an SQL dump, a vhost config, or other types of files pulled from a private repo or secure location.etc.
	 - This directory should be ignored in the /app git repo
	 - To persist db data, create a subdirectory called /datadir
 5. Run docker-compose up
	 - It is assumed that the /app repo has the appropriate docker-compose file referencing the web-app-builder image.
 6. Connect to a running service and execute the necessary commands:
 	  - With the web server you might use CLI tools like composer, npm, artisan to build the app.
	  - With the db server you might initial data
	  - To connect to a service via the shell try 'docker exec -ti container_name bash'
 7. Create a hosts file entry to view the running app in a browser.
 8. Develop/ write code as normal in the working directory of the host, committing valid updates to the repo.

## Instructions for Building a Deployable Image

 1. Use this image to build a running version of the web app you want to snapshot, and then create a single file archive of it.
	 - This can be done manually or with an automated tool like Jenkins.
 2. Then, using the production Dockerfile included with the /app repo, do a build importing (mounting) this newly created archive into a running container.
	- Include any other necessary configuration files.
 3. Commit/tag the running image. This is your all-inclusive image for deployments.
	- All-inclusive refers to the web-stack dependencies, not other required resources like databases, and other service dependencies.
