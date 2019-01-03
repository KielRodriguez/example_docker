pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        script {
<<<<<<< HEAD
          container_custom = docker.build("example_docker:${GIT_COMMIT}")
=======
          container_custom = docker.build("example_docker:${GIT_COMMIT}", "--no-cache .")
>>>>>>> c0ed7a19e8e3aec1e720411e556d7144fee8589a
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