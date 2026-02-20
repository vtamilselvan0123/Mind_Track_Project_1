pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t brain-tasks-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop brain-app || true
                docker rm brain-app || true
                docker run -d -p 3000:3000 --name brain-app brain-tasks-app
                '''
            }
        }

    }
}

