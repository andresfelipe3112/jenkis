pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "nodejs-app:latest"
    }

    stages {
        stage('Clonar el repositorio') {
            steps {
                git 'https://github.com/andresfelipe3112/jenkis'
                sh 'ls -la' // Agregado para listar archivos
            }
        }

        stage('Construir imagen Docker') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
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
