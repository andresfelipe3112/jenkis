pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nodejs-app:latest"
    }


    stages {
        stage('Clonar el repositorio') {
            steps {
                git clone 'https://github.com/tu-usuario/tu-repo.git'
            }
        }

        stage('Construir imagen Docker') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Ejecutar contenedor Docker') {
            steps {
                script {
                    sh 'docker run -d -p 8080:8080 $DOCKER_IMAGE'
                }
            }
        }

        stage('Ejecutar pruebas') {
            steps {
                echo 'No se han definido pruebas aún'
            }
        }
    }

    post {
        always {
            sh 'docker ps -q --filter "ancestor=$DOCKER_IMAGE" | xargs -r docker stop'
            sh 'docker ps -a -q --filter "ancestor=$DOCKER_IMAGE" | xargs -r docker rm'
        }
    }
}
