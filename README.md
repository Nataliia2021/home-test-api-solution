# Home Test API Solution

This project contains Karate BDD tests for the demo API running at `http://localhost:3100/api`.

## Prerequisites

- Java 17 or higher installed
- Maven installed
- Docker installed and running

```bash
brew install openjdk@17
export JAVA_HOME=$(/usr/libexec/java_home -v17)
export PATH=$JAVA_HOME/bin:$PATH

## Setup and Running the API Server

1. Pull and run the demo API Docker image:

docker pull automaticbytes/demo-app
docker run -p 3100:3100 automaticbytes/demo-app

 
2.Verify the API is running at:
http://localhost:3100/api


3. Run tests
mvn test

3.From the project root directory (where pom.xml is located), execute:
mvn test

4.Project Structure
├── README.md
├── pom.xml
└── src
    └── test
        └── java
            └── features
                ├── add-item.feature
                └── inventory.feature



Features
inventory.feature: Contains tests to get all menu items, filter items by ID, add items with validations for existing IDs or missing fields.

add-item.feature: Adds an item with a dynamically generated ID and returns the ID for use in other tests.