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
			-Dsonar.sources=. -X\
			-Dsonar.host.url=http://127.0.0.1:9000 \
  			-Dsonar.token=sqp_17a690f43aefd8b59a109dcb1e16530a1f2e33cd
		    """
                }
            }
        }
    }
}





