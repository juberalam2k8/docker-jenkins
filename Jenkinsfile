pipeline {
  environment {
    registry = "juberalam2k8/docker-jenkins"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
   when {
                branch 'develop'
            }
    stage('Cloning Git') {
      steps {
        git 'https://github.com/juberalam2k8/docker-jenkins.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
     when {
                branch 'master'
            }
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }

   stage('Pull Image') {
     when {
                branch 'qa'
            }
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.pull()
          }
        }
      }
    }
  }
}