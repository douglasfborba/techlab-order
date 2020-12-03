pipeline {

    agent any

    stages {

        stage('Build') {
            steps {
                echo "Building project..."
            }
        }

        stage('Test') {
            steps {
                echo "Testing project..."
            }
        }

        stage('Push') {
            steps {
                echo "Pushing image to registry..."
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying project..."
            }
        }
    }
}
