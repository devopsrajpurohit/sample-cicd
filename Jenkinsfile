pipeline {
    agent any
    environment {
        CI = 'true'
    }
    
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t arajpurohit/nginx-cicd:${GIT_BRANCH}-${GIT_COMMIT}-${BUILD_NUMBER} --build-arg GREET=World .'
            }
        }
      
    }
}
