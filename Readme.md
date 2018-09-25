Copy website data to web directory. Apache uses web/public as root directory.  
Copy server data to server directory. (including sources, data, config.lua)  

To start project use: docker-compose up -d  

To compile & run tfs you need to execute bash shell in server container using: docker-compose run server --entrypoint /bin/bash  
Server is located in /server folder.  

