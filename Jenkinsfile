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
        echo "Semgrep не запускается, пока разбираюсь, в чем ошибка"
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
        sh 'docker build -t alisheradylov/jenkins-images:latest .'
      }
    }
    
    stage('Container Scanning (Trivy)') {
      steps {
        sh 'trivy image > scanning.txt'
      }
    }
    
    stage('Publishing') {
      steps {
        withDockerRegistry(credentialsId: 'dockerhub-cred', url: 'https://index.docker.io/v1/') {
          sh '''
             docker push alisheradylov/jenkins-images:latest
          '''
        }
      }
    }
    
    stage('Deployment') {
      steps {
        sh 'docker run -d -p 8888:8000 image'
      }
    }
    
     stage('DAST Scan (OWASP ZAP)') {
      steps {
        echo "Не успел"
        //sh 'zap-baseline.py -t http://localhost:8888 -r report.html'
      }
    }
  }
} 
