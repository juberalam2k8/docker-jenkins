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
        println '***********************************DEVELOP STAGE STARTS****************************************************'
        git 'https://github.com/juberalam2k8/docker-jenkins.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
          println '********************************DEVELOP STAGE ENDS********************************************************'
        }
      }
    }
    stage('Deploy Image') {
     when {
                branch 'master'
            }
      steps{
        script {
          bat "echo *******************************DEPLOYING IMAGES*************************************************************"
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          bat "echo **********************************END DEPLOYMENT************************************************************"
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
           bat "docker pull juberalam2k8/docker-jenkins:latest"
          // bat 'docker pull juberalam2k8/${env.build_num}'
           }
	
        }
      }
    }
  }
}