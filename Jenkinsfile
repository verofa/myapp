pipeline {
   agent {
        node {
            label 'commercial-linux-slave'
        }
   }
  environment {
    DOCKER_FILE="Dockerfile"
    DOCKER_PUSH_REPO="verogo"
    DOCKER_IMAGE="myapp"
    DOCKER_TAG="1.0"
    USERNAME="verogo"
  }
  stages {
       stage('checkout repo') {
            steps {
              deleteDir()
              checkout scm
            }
        }
       stage('docker login') {
            steps {
              sh """
              docker login --username="$USERNAME" --password="$PASSWORD"
              """
            }
        }
        stage('docker build') {
            steps {
                sh """
                   docker build -t "$DOCKER_IMAGE:$DOCKER_TAG.$BUILD_NUMBER" -f "$DOCKER_FILE" .
                   """
            }
        }
        stage('docker push') {
            steps {
                sh """
                   docker tag "$DOCKER_IMAGE:$DOCKER_TAG.$BUILD_NUMBER" "$DOCKER_PUSH_REPO/$DOCKER_IMAGE:$DOCKER_TAG.$BUILD_NUMBER"
                   docker push "$DOCKER_PUSH_REPO/$DOCKER_IMAGE:$DOCKER_TAG.$BUILD_NUMBER"
                   """
            }
        }
  }
}
