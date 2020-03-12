pipeline {
  environment {
    registry = "juberalam2k8/docker-jenkins"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
     when {
                branch 'develop'
            }
      steps {
        git 'https://github.com/juberalam2k8/docker-jenkins.git'
      }
    }
    stage('Building image') {
     when {
                branch 'develop'
            }
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
            docker.withRegistry('', 'dockerhub') {
            //docker.image("https://hub.docker.com/repository/registry-1.docker.io/juberalam2k8/docker-jenkins/") > "C:\\Program Files (x86)\\Jenkins\\workspace\\nkins-multibranch-example_master\\dockerImage.txt" 
            bat 'echo "modified-inside-container" > test.txt' // we can modify files in workspace
		
            bat 'docker pull juberalam2k8/docker-jenkins:20'
           }
        }
      }
    }
  }
}