pipeline {
    environment {
        dockerImageName = "firesofttech/website"
        registryCredential = 'dockerhublogin'  // Replace with your Docker Hub credentials ID
        kubeConfigId = "kubernetes"  // Replace with your Kubernetes configuration ID
    }

    agent any

    stages {
        stage('Checkout Source') {
            steps {
                git branch: 'main', url: 'https://github.com/firesofttech/website.git'
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
                    kubernetesDeploy(configs: "deploymentservice.yml", kubeconfigId: kubeConfigId)
                }
            }
        }
    }
}
