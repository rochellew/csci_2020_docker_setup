# Setup Instructions

This repository provides all the necessary files to quickly set up a local database environment using Docker. This setup ensures everyone in the class is working with the same environment, eliminating "it works on my machine" issues.

## Prerequisites

Before starting, please ensure the following software is installed on your computer: 

* [Docker Desktop](https://www.docker.com/products/docker-desktop): This application manages the containers. Make sure it is installed and running.
* Git: Used to clone this repository.
* A Database Client (Optional but Recommended): While you can use the command line, a visual tool makes database interaction easier. Recommended options include:
    * [Visual Studio Code](https://code.visualstudio.com) (recommended)
        * Install the *SQLTools* plugin by Matheus Teixeria
        * Install the *SQLTools PostgreSQL/Cockroach Driver* plugin by Matheus Teixeria
    * JetBrains [DataGrip](https://www.jetbrains.com/datagrip) (free with ETSU student account)
    * DBeaver (Free and multi-platform)
    
## Initial Setup

Follow these steps to download the files and start your database server:
### 1. Clone the Repository
Open your terminal or command prompt.Navigate to the directory where you want to store your project files.

Execute the following commands to download the setup files and navigate to the proper directory:

```bash
git clone https://github.com/rochellew/csci_2020_docker_setup.git
cd csci_2020_docker_setup
```
### 2. Start the Database Container

Ensure Docker Desktop is open and running in the background.From within the `csci_2020_docker_setup` directory, run the initialization script:

```bash
docker compose up -d
```

The first time you run this, it will download the database image, which may take a few minutes.The `-d` flag runs the container in "detached" mode, meaning it will run in the background.

Wait about 30 seconds for the database to fully initialize.

### 3. Database Connection Details
You can now connect to your running database server using any database client or programming language.

Feel free to run the query in `testquery.sql` to verify that the database has been populated properly.
