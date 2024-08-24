# Notification Service Knowledge

This repository contains a Kotlin-based DropWizard microservice for sending SMS notifications using Twilio.

## CI/CD Status

[![CI](https://github.com/Devin-Apps/Notification-Service-Knowledge/actions/workflows/ci.yml/badge.svg)](https://github.com/Devin-Apps/Notification-Service-Knowledge/actions/workflows/ci.yml)
[![CD](https://github.com/Devin-Apps/Notification-Service-Knowledge/actions/workflows/cd.yml/badge.svg)](https://github.com/Devin-Apps/Notification-Service-Knowledge/actions/workflows/cd.yml)

## Overview

This microservice provides an API endpoint for sending SMS notifications. It is containerized using Docker and deployed on AWS ECS using a CI/CD pipeline implemented with GitHub Actions.

## Features

- Send SMS notifications using Twilio
- Containerized with Docker
- Continuous Integration and Deployment using GitHub Actions
- Deployed on AWS ECS

## Getting Started

### Prerequisites

- Java 11
- Maven
- Docker
- AWS CLI (for deployment)

### Local Development

1. Clone the repository:
   ```
   git clone https://github.com/Devin-Apps/Notification-Service-Knowledge.git
   ```

2. Build the project:
   ```
   mvn clean package
   ```

3. Run the application:
   ```
   java -jar target/notification-service-1.0-SNAPSHOT.jar server config.yml
   ```

### Docker

To build and run the Docker container:

1. Build the Docker image:
   ```
   docker build -t notification-service:latest .
   ```

2. Run the Docker container:
   ```
   docker run -p 8080:8080 -e TWILIO_ACCOUNT_SID=your_account_sid -e TWILIO_AUTH_TOKEN=your_auth_token notification-service:latest
   ```

## API Usage

To send an SMS notification:

```
curl -X POST 'http://localhost:8080/api/v1/SMSnotifications' \
     -H 'Content-Type: application/json' \
     -d '{"fromNumber":"+12564491299","toNumber":"+919027652516","message":"hi"}'
```

## Deployment

The application is automatically deployed to AWS ECS when changes are pushed to the main branch. The deployment process is managed by the GitHub Actions workflow defined in `.github/workflows/cd.yml`.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.
