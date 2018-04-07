# Dockerized Ubuntu Server

An easy to set up Ubuntu server for a PHP development environment without requiring you to install PHP, composer, mysql, a web server and any other server software on your local machine.

## Main software included

* Ubuntu 16.04
* Git
* PHP 7.0
* Apache
* MySQL
* Redis
* Composer

## Getting Started

### Installing

Install Docker ( https://www.docker.com/community-edition )

Duplicate .env.example file and rename it as .env.

Update the configuration .env file with your project path and update if you want the ssh password.

### Installing

Open a terminal window, go to this project folder and enter:  

```
docker-compose up
```

Wait until is installed. Now you have a complete Ubuntu server running in your machine.

## How to Use

### Apache

Apache web server is running on:

```
localhost:8080
```

The var/www folder references the app folder in the .env file.

### SSH

To connect to the server using ssh, in a terminal window enter:

```
ssh root@localhost -p 2022
```

Now you can use composer or, for example, if you are using Laravel/Lumen artisan.

### Mysql

To externally connect to mysql:

```
Host: localhost
Username: root
Password: secret
Port: 3306
```

If you are connecting internally, for example, to connect your app with Mysql there is no password:

```
Host: localhost
Username: root
Password: 
Port: 3306
```

## Warning

This environment is intended to be used as a development environment. Please, DO NOT USE it in a production/real environment. 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
