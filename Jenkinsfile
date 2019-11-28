node {
    cleanWs()
    stage("repository clone") {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/umapathireddy/poc-hm.git']]])
    }
    stage("maven build") {
       // sh "mvn clean package"
    }
    stage("soanr analysis"){
    //sh "mvn sonar:sonar"
    }
     stage("build & SonarQube analysis") {
          node {
              withSonarQubeEnv('SOANR_QUBE') {
                 sh 'mvn clean package sonar:sonar'
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
      
    stage("tomcat deployment"){
       // sh 'cp /var/lib/jenkins/workspace/poc/target/hello-1.0.war /home/uma_willpower/apache-tomcat-8.5.47/webapps'
    }
    stage('docker build'){
        //sh 'docker build -t poc5 .'
     
    }
    stage("docker compose"){
       // sh "docker-compose up -d"
    }
    stage("k8s deployment"){
       // sh """
        //kubectl create -f deployment.yaml
       // """
    }
    stage("k8s services"){
       // sh """
        //kubectl create -f service.yaml
        //"""
    }
}
