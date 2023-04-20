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
        sh 'semgrep -o reports/semgrep-report.json src/'
        archiveArtifacts artifacts: 'reports/**', allowEmptyArchive: true
        steps {
          sh 'git add .'
          git commit -m "Added security scanner reports"
          git push
        }  
      }
    }
    
    stage('SCA Scan (Dependency Check)') {
      steps {
        sh 'dependency-check.sh'
        archiveArtifacts 'dependency-check-report.html'
      }
    }
    
    stage('Build') {
      steps {
        sh 'docker build -t myimage .'
      }
    }
    
    stage('Container Scanning (Trivy)') {
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
        sh 'docker run -d -p 8080:80 myimage'
      }
    }
    
    stage('DAST Scanning (OWASP ZAP)') {
      steps {
        sh 'zap-baseline.py -t http://localhost:8080 -g report.html'
        archiveArtifacts 'report.html'
      }
    }
  }
}
