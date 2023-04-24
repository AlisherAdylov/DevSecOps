# DevSecOps

## Установка Jenkinks

Для установки **Jenkins** на **Ubuntu** нам понадобится установить на хостовую машину **java**, для этого открываем терминал комбинацией клавиш **Ctrl+Alt+T** и прописываем следующие команды:
- `*sudo apt update*`
- `*sudo apt install openjdk-11-jre*`

Далее устанавливаем **Jenkins**:
- `*curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null*`
- `*echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null*`
- `*sudo apt-get update*`
- `*sudo apt-get install jenkins*`

Источник: *https://www.jenkins.io/doc/book/installing/linux/*

Здравствуйте! К сожалению, **я не справился с заданием**. Мне было очень интересно попробовать себя в соверешенно новой обстановке, до этого ни разу не работал с **Jenkins, SAST – Semgrep, SCA – Dependency Check, Container Scanning – Trivy, DAST – OWASP ZAP**, да и в целом с DevOps инструментами я был знаком только в теории, но мне было интересно изучать это. Я обязательно попробую и после дедлайна доделать этот проект и затем перейти ко второму заданию.

Но на данный момент у меня работает только 1 Pipeline Сheckout SCM. В остальных у меня возникали ошибки и я закомментировал свои наработки. Вы можете посмотреть их в **Jenkinsfile**.

### Спасибо вам огромное, что дали мне такой опыт! Теперь я знаю, что мне нужно изучать и как будет возможность я испытаю свои силы еще раз!
