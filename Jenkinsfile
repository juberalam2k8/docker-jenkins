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
           // bat 'echo $BUILD_NUMBER > test.txt'
	   // bat "echo version := 1.0.${env.BUILD_ID} >> test.txt"
	    bat "echo docker-jenkins:${env.BUILD_NUMBER} > test.txt"
            //set file_data=type test.txt
            //echo %file_data%
            //set a = bat 'type test.txt'
           // dockerImage.pull('docker-jenkins:${env.BUILD_NUMBER}')
           def filePath = readFile "C:\\Program Files (x86)\\Jenkins\\workspace\\jenkins-multibranch-example_qa\\test.txt" 
           def lines = filePath.readLines()
           env.build_num= lines
           bat "docker pull juberalam2k8/${env.BUILD_NUMBER}
          // bat 'docker pull juberalam2k8/${env.build_num}'
           }
	
        }
      }
    }
  }
}