pipeline {
    agent any
    environment {
        CI = 'true'
    }
    
    stages {
        stage('Build') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-login')])
                sh 'docker build -t arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER} --build-arg env=${GIT_BRANCH} .'
                sh 'docker scan arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER}'
            }
        }
        stage('Artifact ') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-login')])
                sh 'docker push arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER}'
            }
        }
         stage('Deploy to Dev environment  ') {
            steps {
                sh 'echo deploying '
            }
        }
         stage('Deploy to Staging environment ') {
            steps {
                 sh 'echo deploying '
            }
        }
         stage('Deploy to Prod Env') {
            steps {
                  sh 'echo deploying '
            }
        }
      
    }
}
