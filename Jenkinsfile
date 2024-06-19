pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the Terraform configuration files from the repository
                checkout scm
            }
        }

        stage('Set AWS Credentials') {
            steps {
                script {
                    // Read AWS credentials from ~/.aws/credentials file
                    withCredentials([[$class: 'FileCredentialsBinding', credentialsId: 'aws-credentials-file', variable: 'AWS_CREDENTIALS_FILE']]) {
                        // Use AWS credentials file in Terraform commands
                        sh '''
                            export AWS_SHARED_CREDENTIALS_FILE=$AWS_CREDENTIALS_FILE
                            terraform init
                        '''
                    }
                }
            }
        }

        stage('Apply Terraform') {
            steps {
                script {
                    // Use AWS credentials file in Terraform apply
                    withCredentials([[$class: 'FileCredentialsBinding', credentialsId: 'aws-credentials-file', variable: 'AWS_CREDENTIALS_FILE']]) {
                        sh '''
                            export AWS_SHARED_CREDENTIALS_FILE=$AWS_CREDENTIALS_FILE
                            terraform apply -auto-approve
                        '''
                    }
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
