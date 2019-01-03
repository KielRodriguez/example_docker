pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        script {
          container_custom = docker.build("example_docker:${GIT_COMMIT}", "--no-cache .")
        }

      }
    }
  }
}