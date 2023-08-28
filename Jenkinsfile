pipeline {
    agent any
    
    environment{
    	DOCKERHUB_CREDENTIALS = credentials('jenkins-dockerhub')
    }
    
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
                  -Dsonar.sources=. -X \\
                  -Dsonar.host.url=http://172.18.0.1:9000 \\
                  -Dsonar.token=sqp_17a690f43aefd8b59a109dcb1e16530a1f2e33cd'''    
            }
        }
        
        stage('build image'){
            steps{
                sh 'docker build -t image:${BUILD_NUMBER} -f ./Dockerfile .'
            }
        }
        
        stage('DockerHub-Login'){
        	steps{
        		sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u DOCKERHUB_CREDENTIALS_USR --password-stdin'
        	}
        }
        
        stage('DockerHub-Push'){
        	steps{
        		sh 'docker tag image:${BUILD_NUMBER} masifjahangir1/devops-assignment:${BUILD_NUMBER}'
                	sh 'docker push masifjahangir1/devops-assignment:${BUILD_NUMBER}'
        	}
        }
        
    }
    
    post{
    	always{
    		sh'docker logout'
    	}
    }
}





