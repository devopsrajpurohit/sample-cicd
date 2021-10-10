pipeline {
    agent any
    environment {
        CI = 'true'
        registry = "arajpurohit/nginx-cicd" 
        registryCredential = 'docker-login' 
        containerImage=''

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
                    docker.withRegistry( '', registryCredential ) { 
                        containerImage.push() 
                        containerImage.scan() 
                   }
                 }
               }
        }
      
    }
}