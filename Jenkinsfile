pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1' // specify your region
        AWS_CREDENTIALS_ID = 'aws_credentails' // replace with your AWS credentials ID
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the Terraform configuration files from the repository
                checkout scm
            }
    }

        stage('Initialize Terraform') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                    sh 'terraform init'
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]) {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
