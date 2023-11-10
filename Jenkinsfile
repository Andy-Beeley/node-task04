pipeline {
    agent any
    stages {
        stage('Clean up') {
            steps {
                script {
                    try {
                        sh "bash ./jenkins/cleanup.sh"
                    } catch (Exception e) {
                        echo "Failed to clean up"
                    }
                }
            }
        }
        stage('Build images') {
            steps {
                script {
                    try {
                        sh "docker build -t node-image:$(BUILD_NUMBER) ."
                    } catch (Exception e) {
                        echo "Failed to build images"
                    }
                }
            }
        }
        stage('Create network') {
            steps {
                script {
                    try {
                        sh "docker network create node-network"
                    } catch (Exception e) {
                        echo "Failed to create network"
                    }
                }
            }
        }
        stage('Run Container') {
            steps {
                script {
                    try {
                        sh "docker run -d -p 80:5000 --network node-network --name node-app node-image:$(BUILD_NUMBER)"
                    } catch (Exception e) {
                        echo "Failed to run node app container"
                    }
                }
            }
        }
    }
}