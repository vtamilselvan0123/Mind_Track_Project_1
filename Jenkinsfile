pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t brain-tasks-app .'
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag brain-tasks-app tamil2301/brain-tasks-app:latest'
            }
        }

        stage('Push to DockerHub') {
            steps {
                sh 'docker push tamil2301/brain-tasks-app:latest'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker stop brain-app || true
                docker rm brain-app || true
                docker run -d -p 3000:3000 --name brain-app tamil2301/brain-tasks-app:latest
                '''
            }
        }

    }
}

