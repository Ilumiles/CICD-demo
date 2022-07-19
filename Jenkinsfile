pipeline {
  agent any
  tools {
    maven 'Maven' 
       }
  stages {
    stage ('Build') {
      steps {
        sh 'mvn clean install -DskipTest'
      }
    }
    stage ('Deploy To Tomcat Server') {
      steps{
        script {
        deploy adapters: [tomcat9(credentialsId: 'tomcat', path: '', url: 'http://3.92.21.131:8080/')], contextPath: 'web', war: '**/*.war'
      }
     }
   }
    stage ('Deploy To dockerhub') {
      steps{
        script {
          echo "building the docker image..."
      withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        sh 'docker build -t ilumiles/learning:1.0 .'
        sh "echo $PASS | docker login -u $USER --password-stdin"
        sh 'docker push ilumiles/learning:1.0'
        }
      }
     }
   }
 }
}

