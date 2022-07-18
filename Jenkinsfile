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
        deploy adapters: [tomcat9(credentialsId: '879944db-d174-424a-9093-3f6585c4a2df', path: '', url: 'http://3.239.196.32:8080/')], contextPath: '/web', war: '**/*.war'
      }
     }
   }
 }
}

