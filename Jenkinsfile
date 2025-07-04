pipeline{
    agen any

    environment{
        DOCKER_IMAGE = 'apimodenas'
        CONTAINER_NAME = 'dockerapimonedas'
        DOCKER_NETWORK = 'dockerbdmonedas_red'
        DOCKER_BUILD_DIR = 'presentacion'
        HOST_PORT = '9080'
        CONTAINER_PORT = '8080'
    }

    stages{
        stage('Compilación Maven'){
            steps{
                bat 'mvn clean package -Dskiptests'
            }
        }
        stage('Construir imagen'){
            steps{
                dir("${DOCKER_BUILD_DIR}"){
                    bat "docker build . -p ${DOCKER_IMAGE}"
                }
            }
        }
        stage('Desplegar Contener'){
            steps{
                bat "docker run --network ${DOCKER_NETWORK} --name ${CONTAINER_NAME} -p ${HOST_PORT}:${CONTAINER_PORT} -d ${DOCKER_IMAGE}"
            }
        }
    }
}