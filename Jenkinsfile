pipeline {
    agent any
    tools {
        maven 'maven3'
    }    
    
    stages {

        
        stage('Build') {
            when {
                expression {
                    return env.BRANCH_NAME != 'master' 
                }
            }
            steps {
                script {
                    def version = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
                    sh "mvn clean package -Dversion=${version}"
                }
            }
        }
        
        stage('Test') {
            when {
                expression {
                    return env.BRANCH_NAME != 'master' 
                }
            }
            steps {
                script {
                    def version = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
                    sh "mvn test -Dversion=${version}"
                }
            }
        }
    }
    
    post {
        success {
            script {
                def version = "${env.BRANCH_NAME}-${env.BUILD_NUMBER}"
                archiveArtifacts artifacts: '**/target/*.jar', allowEmptyArchive: true
                echo "Artifacts for ${env.BRANCH_NAME} version ${version} have been archived."
            }
        }
    }
}
