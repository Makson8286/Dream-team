pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS_ID = 'dockerHub'
        CONTAINER_NAME = 'maks'
    }
   

    stages {
        
        
       stage('Login Docker') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: DOCKER_CREDENTIALS_ID, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                        sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
                    }
                }
            }
        }
        
        stage('Copy git ') {
            steps {
                script {
                    sh 'git clone --branch maks --single-branch https://github.com/Makson8286/Dream-team.git'
                }
            }
        }

        stage('build Docker image') {
            steps {
                script {
                    sh 'docker build -t maks/creator .'
                }
            }
        }

        stage('Push in Hub') {
            steps {
                script {
                    sh 'docker push maks/creator '
                }
            }
        }

             stage('Delete old images') {
            steps {
                script {
                    sh 'docker image prune -a --filter "until=24h" --force'

                }
            }
        }
        
        
        stage('Start Docker container') {
            steps {
                script {
                    sh 'docker run -d -p 8081:80 --name ${CONTAINER_NAME} --health-cmd="curl --fail http://localhost:80 || exit 1" maks/creator '

                }
            }
        }
    }
}