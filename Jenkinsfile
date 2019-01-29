pipeline {
    agent { label 'docker' }
    stages {
        stage('Build') {
            steps {
                sh 'git clean -fdx'
                sh "docker build -t ${GIT_COMMIT} ."
            }
        }
        stage('Publish to Docker Hub') {
            when {
                branch 'master'
            }
            steps {
                sh "docker tag master rogfk/consultant-portal-frontend:${BUILD_NUMBER}"
                withDockerRegistry([credentialsId: 'rfkikt', url: '']) {
                    sh "docker push rogfk/consultant-portal-frontend:${BUILD_NUMBER}"
                }
            }
        }

        stage('Build backend') {
            when { branch 'master' }
            steps {
                build job: 'Rogaland/consultant-portal-backend/master', wait: false
            }
        }

    }
}