pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        script {
          container_custom = docker.build("example_docker:1.0.1")
        }

      }
    }
  }
}