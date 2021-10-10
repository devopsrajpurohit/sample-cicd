pipeline {
    agent any
    environment {
        CI = 'true'
    }
    
    stages {
        stage('Build') {
            withCredentials([usernamePassword(credentialsId: 'myregistry-login', passwordVariable: 'DOCKER_REGISTRY_PWD', usernameVariable: 'DOCKER_REGISTRY_USER')])
            steps {
                sh 'docker build -t arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER} --build-arg env=${GIT_BRANCH} .'
                sh 'docker scan arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER}'
            }
        }
        stage('Artifact ') {
            withCredentials([usernamePassword(credentialsId: 'docker-login')])
            steps {
                sh 'docker push arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER}'
            }
        }
         stage('Deploy to Dev environment  ') {
            steps {
                sh 'docker push arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER}'
            }
        }
         stage('Deploy to Staging environment ') {
            steps {
                sh 'docker push arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER} --build-arg env=${GIT_BRANCH}'
            }
        }
         stage('Deploy to Prod Env') {
            steps {
                sh 'docker push arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER} --build-arg env=${GIT_BRANCH}'
            }
        }
      
    }
}
