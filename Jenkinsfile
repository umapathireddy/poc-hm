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
     stage("maven build") {
       sh "mvn clean package"
    }
    stage ("codecovarage"){
        //jacoco buildOverBuild: true, changeBuildStatus: true, deltaBranchCoverage: '3', deltaClassCoverage: '6', deltaComplexityCoverage: '4', deltaInstructionCoverage: '2', deltaLineCoverage: '3', deltaMethodCoverage: '4', exclusionPattern: '**/*Test*.class', inclusionPattern: '**/*.class', maximumBranchCoverage: '1', maximumClassCoverage: '9', maximumComplexityCoverage: '2', maximumInstructionCoverage: '2', maximumLineCoverage: '5', maximumMethodCoverage: '7', minimumBranchCoverage: '7', minimumComplexityCoverage: '8', minimumInstructionCoverage: '6', minimumLineCoverage: '7', minimumMethodCoverage: '7', skipCopyOfSrcFiles: true, sourceExclusionPattern: 'generated/**/*.java'
    }
stage("nexus"){
nexusPublisher nexusInstanceId: 'Nexus', nexusRepositoryId: 'mavan-digital-sky', packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: '**/*.war']], mavenCoordinate: [artifactId: 'hello', groupId: 'com.boxfuse.samples', packaging: 'war', version: '1.0']]], tagName: 'latest' }
}
      
    
