node {
    cleanWs()
    stage("repository clone") {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/umapathireddy/poc-hm.git']]])
    }
     stage("SonarQube analysis") {
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
      }        
     stage("maven build") {
       sh "mvn clean package"
    }
    stage ("codecovarage"){
        jacoco buildOverBuild: true, changeBuildStatus: true, maximumBranchCoverage: '2', maximumComplexityCoverage: '3', maximumInstructionCoverage: '20', maximumLineCoverage: '4', skipCopyOfSrcFiles: true
    }
    
}
      
    
