pipeline {
    agent any
    environment {
        CI = 'true'
        registry = "arajpurohit/nginx-cicd" 
        registryCredential = 'docker-login' 
        containerImage=''
        tag="$GIT_BRANCH-$GIT_COMMIT-$BUILD_NUMBER"

     }
    
    stages {
        stage('Build') {
            steps {
                script {
                    containerImage = docker.build registry + ":$tag" 
                }         
            }
        }
        stage('Artifact ') {
            steps {
                 script { 
                    docker.withRegistry( '', registryCredential ) { 
                        containerImage.push() 
                   }
                 }
               }
        }

         stage('deploying for development') {
            when {
                branch 'main' 
            }
            steps {
                sh 'helm upgrade nginx -n prod  -f values.yaml -f values-prod.yaml ./charts --set=image.tag=$tag '
            }
        }
         stage('deploying for development') {
            when {
                branch 'staging' 
            }
            steps {
                sh 'helm upgrade nginx  -n dev staging -f values.yaml -f values-staging.yaml ./charts --set=image.tag=$tag '
            }
        }
        stage('deploying for development') {
            when {
                branch 'devlopment' 
            }
            steps {
                sh 'helm upgrade nginx -n dev -f values.yaml -f values-dev.yaml ./charts --set=image.tag=$tag '
            }
        }
    }
}