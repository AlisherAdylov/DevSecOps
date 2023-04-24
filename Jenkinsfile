pipeline {
  agent any
  stages {
    stage('Checkout SCM') {
      steps {
        git branch: 'master', changelog: false, poll: false, url: 'https://github.com/AlisherAdylov/DevSecOps.git'
      }
    }
    
    stage('SAST Scan (Semgrep)') {
      steps {
        echo "ХАЙ"
        //sh 'docker run -v ${WORKSPACE}:/src --workdir /src returntocorp/semgrep-agent1:v1 semgrep-agent --config p/ci'
      }
    }
    
    stage('SCA Scan (Dependency Check)') {
      steps {
        dependencyCheck additionalArguments: '--format HTML', odcInstallation: 'DP-Check'
      }
    }
    
    stage('Build') {
      steps {
       // echo "Требует права суперпользователя и пароль, но я не буду давать, небезопасно"
        sh 'docker build -t image:1 .'
      }
    }
    
    stage('Container Scanning (Trivy)') {
      steps {
        sh 'trivy image:1 > scanning.txt'
      }
    }
    
    stage('Publishing') {
      steps {
        withDockerRegistry(credentialsId: 'dockerhub-cred', url: 'https://index.docker.io/v1/') {
          sh '''
             docker push image:1
          '''
        }
      }
    }
    
    stage('Deployment') {
      steps {
        sh 'docker run -d -p 8888:8000 image:1'
      }
    }
    
//Остальные этапы не имеют смысла

   /** 
    
    stage('Publishing') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
          sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
          sh 'docker push myimage'
        }
      }
    }
    
    
    stage('DAST Scanning (OWASP ZAP)') {
      steps {
        sh 'zap-baseline.py -t http://localhost:8080 -g report.html'
        archiveArtifacts 'report.html'
      }
    } **/
  }
} 
