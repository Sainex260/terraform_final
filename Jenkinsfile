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
                    withCredentials([[$class: 'FileCredentialsBinding', credentialsId: 'aws_credentails', variable: 'aws_cred_profile']]) {
                        // Use AWS credentials file in Terraform commands
                        sh '''
                            export AWS_SHARED_CREDENTIALS_FILE=$aws_cred_profile
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
                    withCredentials([[$class: 'FileCredentialsBinding', credentialsId: 'aws_credentails', variable: 'aws_cred_profile']]) {
                        sh '''
                            export AWS_SHARED_CREDENTIALS_FILE=$aws_cred_profile
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
