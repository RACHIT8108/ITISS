pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    extensions: [],
                    userRemoteConfigs: [[
                        url: 'https://github.com/RACHIT8108/ITISS.git'
                    ]]
                ])
            }
        }

        stage('Build') {
            steps {
                echo 'Executing python script...'
                sh 'python3 helloworld.py'
            }
        }

        stage('PyTest') {
            steps {
                echo 'Running PyTest...'
                sh 'python3 -m pip install --upgrade pip'
                sh 'python3 -m pip install pytest'
                sh 'python3 -m pytest'
            }
        }

        stage('Docker Deploy') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t myapp:latest .'

                echo 'Deploying Docker container...'
                sh '''
                    docker rm -f myapp_container11 2>/dev/null || true
                    docker run -d --name myapp_container11 myapp:latest
                '''
                echo 'Docker deployment completed successfully!'
            }
        }
    }
}
