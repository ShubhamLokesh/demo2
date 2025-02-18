pipeline {
    agent any

    environment {
        IMAGE_NAME = "my-python-app"
        DOCKER_HUB_USER = "shubhamkapasiya"  // Change to your Docker Hub username
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/ShubhamLokesh/demo2.git'
                // git 'https://github.com/ShubhamLokesh/demo2.git'  // Change this to your GitHub repo
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_HUB_USER/$IMAGE_NAME:latest .'
            }
        }

        stage('Run Container Locally') {
            steps {
                sh 'docker stop my-python-app || true && docker rm my-python-app || true'
                sh 'docker run -d -p 5000:5000 --name my-python-app $DOCKER_HUB_USER/$IMAGE_NAME:latest'
            }
        }
    }

    // post {
    //     success {
    //         mail to: 'your-email@example.com',
    //             subject: 'Jenkins Build SUCCESS: Python App',
    //             body: 'The latest build of your Python app was successful! 🚀'
    //     }
    //     failure {
    //         mail to: 'your-email@example.com',
    //             subject: 'Jenkins Build FAILED: Python App',
    //             body: 'The latest build of your Python app has failed. Please check the logs. ❌'
    //     }
    // }
}
