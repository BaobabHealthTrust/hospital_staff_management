# hospital_staff_management
a staff management test project containing a ruby on rails backend with a vue-js frontend 

## Setup
 - clone the project
 
```
    git clone https://github.com/BaobabHealthTrust/hospital_staff_management.git
```
 
 - cd into the project directory
 - rename the database copy.yml file by running:
 
 ```
  cp config/database_copy.yml config/database.yml
 ```
 
 - configure the database.yml file in the config folder with your environment
 
 - setup your database and add a user run:

 ```
 rails db:setup
 ```

 - start the server with: 
 
 ```
  bin/rails server
 ```

### Credentials
 ```
 username: admin
 password: test
 ```