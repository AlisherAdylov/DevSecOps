pipeline {
  agent any
  stages {
    stage('Checkout SCM') {
      steps {
        git 'https://github.com/AlisherAdylov/DevSecOps.git'
      }
    }
    
    stage('SAST Scan (Semgrep)') {
      steps {
          echo "Semgrep не выполняет свою работу. Jenkins не может его найти, но он есть и работает я проверял"
          //sh 'semgrep -o reports/semgrep-report.json src/'
      }
    }
    
    stage('SCA Scan (Dependency Check)') {
      steps {
        echo "Очень долго проверяет, остановил процесс"
        //sh 'dependency-check.sh --data /home/roflandevops/data --scan . --format HTML --project "My Project" -o dependency-check-report.html'
      }
    }
    
    stage('Build') {
      steps {
        echo "Требует права суперпользователя и пароль, но я не буду давать, небезопасно"
        //sh 'docker build -t myimage .'
      }
    }
    
//Остальные этапы не имеют смысла

   /** stage('Container Scanning (Trivy)') {
      steps {
        sh 'trivy myimage'
        archiveArtifacts 'trivy-results.json'
      }
    }
    
    stage('Publishing') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker-hub-creds', usernameVariable: 'DOCKER_HUB_USERNAME', passwordVariable: 'DOCKER_HUB_PASSWORD')]) {
          sh 'docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD'
          sh 'docker push myimage'
        }
      }
    }
    
    stage('Deployment') {
      steps {
        sh 'docker run -d -p 8081:80 myimage'
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
