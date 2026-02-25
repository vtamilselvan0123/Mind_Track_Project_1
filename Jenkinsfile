pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "tamil2301/brain-tasks-app"
    }

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

        stage('DockerHub Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds',
                usernameVariable: 'DOCKER_USER',
                passwordVariable: 'DOCKER_PASS')]) {

                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
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
                docker stop brain-tasks-container || true
                docker rm brain-tasks-container || true
                docker run -d -p 3000:3000 --name brain-tasks-container tamil2301/brain-tasks-app:latest
                '''
            }
        }
    }
}
stage('Deploy to Kubernetes') {
    steps {
        sh 'kubectl apply -f deployment.yaml'
        sh 'kubectl apply -f service.yaml'
    }
}

