pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Surajsuthar01/demo-repo2.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("my-httpd-image")
                }
            }
        }

        stage('Deploy with Ansible') {
            steps {
                ansiblePlaybook(
                    playbook: 'deploy.yml',
                    inventory: 'inventory.ini',
                    credentialsId: 'ssh-credentials'
                )
            }
        }
    }
}
