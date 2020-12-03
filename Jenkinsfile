pipeline {

    agent any

    environment {
        JENKINS_TOKEN = credentials('docker-hub-jenkins-token')
        APP_TOKEN = credentials('docker-hub-app-token')
    }
    
    stages {

        stage('Build') {
            steps {
                sh './scripts/build.sh'
                sh './scripts/build-image.sh'
            }

            post {
                success {
                    archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
                }
            }
        }

        stage('Test') {
            steps {
                sh './scripts/mvn.sh test'
            }

            post {                
                always {
                    junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml'
                }
            }
        }

        stage('Push') {
            steps {
                sh './scripts/push.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh './scripts/deploy.sh'
            }
        }
    }
}
