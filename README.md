# Assi7_Pipeline
For Jenkins Test


// Docker file Script(web app)

FROM maven:3.6.3-openjdk-11-slim
# Set the working directory in the container
WORKDIR /usr/src/app
# Copy the Maven project files into the container
COPY pom.xml .
COPY src ./src
# Build the application
RUN mvn clean install
# Expose the port the app runs on
EXPOSE 8080
# Define the command to run your application
CMD ["java", "-jar", "target/your-application.jar"]



// Pipeline Script

pipeline{
    agent any
    tools{
        maven 'M3'
    }
    stages{
        stage("Build maven"){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Aishwarya-Utpat/Assi7_Pipeline.git']])
            }
        }
        stage("Build Docker"){
            steps{
                script{
                    bat "docker build -t aishwaryautpat27/img10 ."
                }
            }
        }
        stage("Push Docker"){
            steps{
                script{
                    bat "docker login -u aishwaryautpat27 -p Aishwarya@27!"
                    bat "docker push aishwaryautpat27/img10"
                }
            }
        }
    }
}
