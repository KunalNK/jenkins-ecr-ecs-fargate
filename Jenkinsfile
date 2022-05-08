pipeline {
  agent any
  stages {
    stage('Create ECS cluster & deploy app') {
        steps {
            withAWS(credentials: 'aws-ecr', region: 'ap-south-1') {
              script{
              if (env_type=='create'){
    stage('Building image') {
                steps{
                  script {
                    dockerImage = docker.build registry + ":latest"
                    sh 'echo $dockerImage'
                  }
                }
    }

    stage('Create AWS ECR repo') {
        steps{
          withAWS(credentials: 'aws-ecr', region: 'ap-south-1'){
            script{
                sh "aws ecr create-repository \
    --repository-name jenkins-cicd"
                }
            }
        }
    }
    stage('Push Image to AWS ECR') {
        steps{
            script{
                docker.withRegistry("https://" + registry, "ecr:ap-south-1:" + registryCredential) {
                    dockerImage.push()
                }
            }
        }
    }
    
    stage('Deploy docker image to AWS ECS container') {
            steps {
                withAWS(credentials: 'aws-ecr', region: 'ap-south-1') {
                  script{
                    sh "chmod +x ./create_cluster.sh"
                    sh "./create_cluster.sh"
                  }
              }


              }
            }
        }
        else {
            sh "chmod +x ./delete_cluster.sh"
            sh "./delete_cluster.sh"
            }
    }
            }
        }
    }
  }
}

    