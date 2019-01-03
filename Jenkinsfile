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
    stage('test') {
      steps {
        script {
          docker.image("postgres:9.6").withRun("-e POSTGRES_PASSWORD=secretpassword -e POSTGRES_USER=postgres -p 5432:5432") { c ->
            docker.image("example_docker:${GIT_COMMINT}").inside("-e RAILS_ENV=test") {
              sh "rake db:create"
              sh "rake db:migrate"
              sh "rake test"

            }
          }
        }
      }
    }
  }
}