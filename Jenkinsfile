pipeline {
  agent any
  stages {
    stage('Create ECR repo in AWS') {
          steps {
              withAWS(credentials: 'aws-ecr', region: 'ap-south-1') {
                script{
                  if (env_type=='create'){
                    sh 'aws ecr create-repository \
    --repository-name jenkins-cicd --output yaml'
                }
              }
          } 
      }
    }
//     stage('Building image') {
//       steps{
//         script {
//           if (env_type=='create'){
//             app = docker.build("jenkins-cicd")
//           sh 'echo app'
//         }
//       }
//     }
//     }
//     stage('Push Image to AWS ECR') {
//         steps{
//           withAWS(credentials: 'aws-ecr', region: 'ap-south-1'){
//             script{
//               if (env_type=='create'){
//                     docker.withRegistry('https://349443600135.dkr.ecr.ap-south-1.amazonaws.com', 'ecr:ap-south-1:aws-ecr') {
//                     app.push("latest")
//                 }
//             }
//         }
//     }
//     }
//     }
    
    
//     stage('Deploy docker image to AWS ECS container') {
//             steps {
//                 withAWS(credentials: 'aws-ecr', region: 'ap-south-1') {
//                   script{
//                   if (env_type=='create'){
//                     sh "chmod +x ./create_cluster.sh"
//                     sh "./create_cluster.sh"
//                   }
//                   else {
//                     sh "chmod +x ./delete_cluster.sh"
//                     sh "./delete_cluster.sh"
//                   }
//                   }
//                 }
//             }
//         }
//     }
// }