<h1 align="center">LARAVEL+DOCKER+BREEZE BOILERPLATE<h1/>

#   Installation Guide

## Step 1: Add a User in MySQL with Docker0 Host and Grant Access

1. **Check the Docker0 Host**:  
    Run the following command to check the IP address of Docker0:
    ```bash
    ifconfig
    ```
    Look for the inet section under docker0.
2. **Add a User in MySQL**:
    Access MySQL through the CLI and execute the following commands:
    ```bash
    CREATE USER 'user-docker'@'<hostdocker0>' IDENTIFIED BY 'docker-up';
    GRANT ALL PRIVILEGES ON *.* TO 'user-docker'@'%';
    FLUSH PRIVILEGES;
    ```
    it will create new user with username user-docker and host depend on docker0 IP that can access your local host db  

## Step 2: Update the MySQL Configuration

1.  **Edit MySQL Configuration**:    
    Modify the MySQL configuration file to set bind-address to 0.0.0.0, allowing connections from any source.

## Step 3: Update Database Configuration in .env

1.  Configure .env:
    Update your Laravel project's .env file to use the new database user credentials.
    ```env
    DB_CONNECTION=mysql
    DB_HOST=172.18.0.1
    DB_PORT=3306
    DB_DATABASE=company-profile
    DB_USERNAME=docker-user
    DB_PASSWORD=docker-up
    ```

## Step 4: Build and Start the Docker Containers
1.  **Build and Start Containers**:
    Run the following command to build and start the Docker containers:
    ```bash
    docker-compose up --build
    ```
## Step 5: Access the Container and Perform Setup
1.  **Access the Container**:
    Use the command below to access your Docker container:
    ```bash
    sudo docker exec -it <container_name> bash
    ```
    Replace ```<container_name>``` with your container's name.
2.  **Generate Application Key**:
    Inside the container, run:
    ```bash
    php artisan key:generate
    ```
3.  **Run Migrations**:
    ```bash
    php artisan migrate
    ```
4.  **Install Composer Dependencies**:
    ```bash
    composer install
    ```
5.  **Install NPM Dependencies**:
    ```bash
    npm install
    ```

## Step 6: Stop and Rebuild Docker Containers
1.  **Stop Containers**:
    Shut down the Docker containers:
    ```bash
    sudo docker compose down
    ```
2.  **Uncomment Dockerfile CMD**:
    Edit your Dockerfile to uncomment the CMD ["entrypoint.sh"] line.
3.  **Rebuild Containers**:
    ```bash
    sudo docker compose up -d --build
    ```

# Conclussion
Your environment is now set up and ready for development.

***JANGAN MALAS MALAS YAAA***