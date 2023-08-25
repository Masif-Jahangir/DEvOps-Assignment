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
        
        stage('Sonar'){
            steps{
                script{
                    scannerHome = tool 'SonarScanner'
                }
                withSonarQubeEnv(installationName: 'SonarScanner') {
                    sh """
			${scannerHome}/bin/sonar-scanner \
			-Dsonar.projectKey=django-project  \
			-Dsonar.sources=.\
		    """
                }
            }
        }
    }
}





