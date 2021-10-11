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

         stage('deploying for prod') {
            when {
                branch 'main' 
            }
            steps {
                sh 'helm upgrade nginx -n prod  -f ./helm-chart/values.yaml -f ./helm-chart/values-prod.yaml ./helm-chart --set=image.tag=$tag '
            }
        }
         stage('deploying for staging') {
            when {
                branch 'staging' 
            }
            steps {
                sh 'helm upgrade nginx  -n  staging -f ./helm-chart/values.yaml -f ./helm-chart/values-staging.yaml ./helm-chart --set=image.tag=$tag '
            }
        }
        stage('deploying for dev') {
            when {
                branch 'devlopment' 
            }
            steps {
                sh 'helm upgrade nginx -n dev -f ./helm-chart/values.yaml -f ./helm-chart/values-dev.yaml  --set=image.tag=$tag  ./helm-chart'
            }
        }
    }
}