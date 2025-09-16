# Multi-stage build for optimized deployment
FROM maven:3.8.6-openjdk-11 AS build

# Set working directory
WORKDIR /app

# Copy pom.xml and download dependencies
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code and build
COPY src ./src
RUN mvn clean package -DskipTests

# Production stage - Use Tomcat with Jakarta EE support
FROM tomcat:10.1-jdk11-openjdk

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from build stage and rename to ROOT.war
COPY --from=build /app/target/CH7_EX_DOWNLOAD.war /usr/local/tomcat/webapps/ROOT.war

# Set environment variables for Tomcat
ENV CATALINA_OPTS="-Xmx512m -Xms256m"
ENV JAVA_OPTS="-Djava.awt.headless=true"

# Ensure proper permissions
RUN chmod +x /usr/local/tomcat/bin/catalina.sh

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
  CMD curl -f http://localhost:8080/ || exit 1

# Start Tomcat
CMD ["catalina.sh", "run"]
