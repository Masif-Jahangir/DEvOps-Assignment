pipeline {
    agent any

    stages {
    
        stage('checkout') {
            steps {
                git(
                    url:'https://github.com/Masif-Jahangir/DevOps-Assignment.git',
                    credentialsId:'jenkin-Id',
                    branch:'master'
                    
                    )
            }
        }
        
        stage('sonarscanner'){
            steps{
            sh '''/opt/sonar-scanner/bin/sonar-scanner \\
                  -Dsonar.projectKey=django-project \\
                  -Dsonar.sources=. \\
                  -Dsonar.host.url=http://172.18.0.1:9000 \\
                  -Dsonar.token=sqp_17a690f43aefd8b59a109dcb1e16530a1f2e33cd'''    
            }
        }
        stage('build image'){
            steps{
                sh 'sudo docker build -t image:${BUILD_NUMBER} -f ./Dockerfile .'
            }
        }
    }
}





