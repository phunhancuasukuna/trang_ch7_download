# CH7 EX DOWNLOAD - Jakarta EE Web Application

This is a Java web application using Jakarta EE (formerly Java EE) that demonstrates file downloads with user registration and cookie management.

## Features
- User registration and login
- Product catalog with downloadable content
- Cookie management for user sessions
- Audio file downloads (MP3 format)

## Technology Stack
- Jakarta EE 5.0 (Servlet API, JSP, JSTL)
- Java 11
- Maven 3.8+
- Apache Tomcat 9.0
- Docker for containerization

## Local Development

### Prerequisites
- Java 11 or higher
- Maven 3.8+
- Docker (optional)

### Running Locally
1. Clone the repository
2. Build the project:
   ```bash
   mvn clean package
   ```
3. Deploy to Tomcat or run with Docker:
   ```bash
   docker build -t ch7-ex-download .
   docker run -p 8080:8080 ch7-ex-download
   ```

## Deployment on Render

### Prerequisites
1. GitHub account
2. Render account (free tier available)

### Steps to Deploy
1. Push your code to a GitHub repository
2. Connect your GitHub repository to Render
3. Render will automatically detect the `render.yaml` configuration
4. The application will be built using the multi-stage Dockerfile
5. Access your deployed application at the provided Render URL

### Configuration Files
- `Dockerfile`: Multi-stage build configuration
- `render.yaml`: Render-specific deployment configuration
- `pom.xml`: Maven build configuration with Jakarta EE dependencies

### Environment Variables
The application uses the following environment variables (automatically configured):
- `PORT`: 8080 (default web port)
- `CATALINA_OPTS`: JVM memory settings
- `JAVA_OPTS`: Java security settings

## Project Structure
```
src/
├── main/
│   ├── java/
│   │   └── murach/
│   │       ├── business/     # Business logic classes
│   │       ├── data/         # Data access classes
│   │       ├── download/     # Servlet controllers
│   │       └── util/         # Utility classes
│   └── webapp/
│       ├── sound/            # Audio files for download
│       ├── styles/           # CSS stylesheets
│       ├── WEB-INF/          # Configuration and data files
│       └── *.jsp             # JSP view pages
```

## Usage
1. Access the application homepage
2. Browse available albums/products
3. Register as a new user or use existing credentials
4. Download available audio files
5. Manage cookies and user sessions

## Notes
- This application uses file-based storage for user data
- Audio files are served directly from the webapp directory
- Sessions and cookies are managed automatically
- The application is optimized for deployment on cloud platforms like Render
