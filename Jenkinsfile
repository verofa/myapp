pipeline {
   agent {
        node {
            label 'master'
        }
   }
  environment {
    DOCKER_FILE="Dockerfile"
    DOCKER_PUSH_REPO="hub.docker.com"
    DOCKER_IMAGE="myapp"
    DOCKER_TAG="1.0"
    USERNAME="username"
    EMAIL="docker hub"
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
              docker login --username="$USERNAME" --email="$EMAIL"
              """
            }
        }
        stage('docker build') {
            steps {
                sh """
                   docker build -t "$DOCKER_IMAGE:$DOCKER_TAG.$BUILD_NUMBER" -f "$DOCKER_FILE"
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
