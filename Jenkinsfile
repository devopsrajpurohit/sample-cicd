pipeline {
    agent any
    environment {
        CI = 'true'
        registry = "arajpurohit/nginx-cicd" 
4       registryCredential = 'docker-login' 
        containerImage=''
5
    }
    
    stages {
        stage('Build') {
            steps {
                script {
                    containerImage = docker.build registry + ":$GIT_BRANCH-$GIT_COMMIT-$BUILD_NUMBER" 
                }         
            }
        }
        stage('Artifact ') {
            steps {
                script {
                 script { 
                    docker.withRegistry( '', registryCredential ) { 
                        dockerImage.push() 
                   }
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
