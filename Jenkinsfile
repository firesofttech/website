pipeline {

  environment {
    dockerImageName = "firesofttech/nginx-website"
    registryCredential = 'dockerhublogin'  // Replace with your Docker Hub credentials ID
    kubeConfigId = "kubernetes"  // Replace with your Kubernetes configuration ID
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git 'https://github.com/firesofttech/website.git'  // Replace with your GitHub repository URL
      }
    }

    stage('Build image') {
      steps {
        script {
          dockerImage = docker.build dockerImageName
        }
      }
    }

    stage('Pushing Image') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "path/to/deploymentservice.yml", kubeconfigId: kubeConfigId)
        }
      }
    }

  }

}
