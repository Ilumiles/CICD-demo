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
 }
}

