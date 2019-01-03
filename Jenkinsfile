pipeline {
  agent any
  stages {
    stage('build') {
      steps {
        script {
          container_custom = docker.build("example_docker:${GIT_COMMIT}")
        }

      }
    }
    stage('test') {
      steps {
        script {
          docker.image("postgres:9.6").withRun("-e POSTGRES_PASSWORD=secretpassword -e POSTGRES_USER=postgres -p 5432:5432") { c ->
            docker.image("postgres:9.6").inside("--link ${c.id}:db") {
                sh "while ! pg_isready -h db -U postgres; do sleep 1; done"
            }
            docker.image("example_docker:${GIT_COMMIT}").inside("--link ${c.id}:db -e RAILS_ENV=test -e HOST=db") {
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