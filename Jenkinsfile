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
                    sh './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar' 
                }
            }
        }
    }
}





