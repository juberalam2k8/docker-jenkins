pipeline {
  environment {
    registry = "juberalam2k8/docker-jenkins"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
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
            sh 'echo $dockerImage >> "C:\\Program Files (x86)\\Jenkins\\workspace\\nkins-multibranch-example_master\\dockerImage.txt"'
            dockerImage.push()
            
          }
        }
      }
    }
  }
}