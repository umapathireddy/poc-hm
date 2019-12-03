node {
    cleanWs()
    stage("repository clone") {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/umapathireddy/poc-hm.git']]])
    }
     /*stage("SonarQube analysis") {
          node {
              withSonarQubeEnv('SOANR_QUBE') {
                 sh 'mvn sonar:sonar'
              }    
          }
      }
      
      stage("Quality Gate"){
          timeout(time: 1, unit: 'HOURS') {
              def qg = waitForQualityGate()
              if (qg.status != 'OK') {
                  error "Pipeline aborted due to quality gate failure: ${qg.status}"
              }
          }
      } */       
     stage("maven build & deploy to nexus") {
       sh "mvn clean deploy"
    }
   /*stage("nexus"){
nexusPublisher nexusInstanceId: 'Nexus', nexusRepositoryId: 'digisky', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/hello-1.0.war']], mavenCoordinate: [artifactId: 'hello', groupId: 'com.boxfuse.samples', packaging: 'war', version: '1.0']]]      
    }*/
}
