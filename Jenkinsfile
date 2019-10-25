node {
    cleanWs()
    stage("repository clone") {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/umapathireddy/poc-hm.git']]])
    }
    stage("maven build") {
        sh "mvn clean package"
    }
    stage("tomcat deployment"){
        sh 'cp /var/lib/jenkins/workspace/poc/target/hello-1.0.war /home/uma_willpower/apache-tomcat-8.5.47/webapps'
    }
    stage('docker build'){
        sh"""
        docker rmi $(docker images -a)
        docker build -t poc2 .
        """
    }
    stage("docker compose"){
        sh "docker-compose up -d"
    }
}
