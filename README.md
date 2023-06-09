# DevSecOps
## Установка необходимых утилит на хостовую машину

### 1. Docker
- `curl -fsSL https://get.docker.com -o get-docker.sh`
- `sudo sh get-docker.sh`

Источник: *https://docs.docker.com/engine/install/ubuntu/*

### 2. Git
- `sudo apt install git`

### 3. Trivy
- `wget https://github.com/aquasecurity/trivy/releases/download/v0.18.3/trivy_0.18.3_Linux-64bit.deb`
- `sudo dpkg -i trivy_0.18.3_Linux-64bit.deb`

Источник: *https://aquasecurity.github.io/trivy/v0.18.3/installation/*

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

### 1. Настройка Jenkins

После установки **Jenkins**, проверяем его статус:
- `sudo service jenkins status`

Видим, что **Jenkins** запущен. Далее открываем браузер и в браузерной строке прописываем локальный IP адрес с портом, на котором открыт **Jenkins**, в моем случае - это 8080:
- `0.0.0.0:8080`

Далее, мы попадаем на окно **Unlock Jenkins**, нам необходимо разблокировать **Jenkins** для дальнейшей работы. Для этого необходимо в терминале открыть файл, где хранится пароль:
- `sudo cat /var/lib/jenkins/secrets/initialAdminPassword`

Копируем полученный пароль и копируем его в поле **Administrator Password**

Далее соглашаемся с установкой плагинов на **Jenkins**, нажав на кнопку **Install suggested plugins**

### 2. Установка необходимых плагинов для Jenkins

Для установки плагинов, нам необходимо перейти в **Available plugins**, по следующему пути *Dashboard > Manage Jenkins > Plugin Manager > Available plugins* и устанавливаем:
- **OWASP Dependency-Check**
- **Docker Pipeline**

### 3. Credentials для DockerHub

Переходим в *Dashvoard > Manage Jenkins > Credentials > System > Global Credentials* и добавляем учетные данные для **DockerHub**, предварительно зарегистрировавшись на *https://hub.docker.com/*

Также необходимо выдать права для **Jenkins**, чтобы он мог работать с docker и перезагрузить **Jenkins**, чтобы изменения вступили в силу.
- `sudo usermod -aG docker jenkins`
- `sudo systemctl restart jenkins`

### 4. Настройка Dependency Check

Переходим в *Dashboard > Manage Jenkins > Global Tool Configuration* листаем в самый низ и выбираем вкладку **Dependency Check**, Жмем кнопку **Add Dependency-Check**, даем имя **Dependency-Check**, ставим галочку на **Install automaticly**, выбираем последнюю версию и сохраняем изменения

### 5. Создание Jenkins Pipeline

- В меню слева выбираем **+ New Item**, придумываем имя для пайплайна, выбираем **Pipeline** и жмем **OK**.
- Листаем вниз, до раздела **Pipeline** и в **Definition** выбираем **Pipeline script from SCM**
- Во вкладке **SCM** выбираем **Git**
- Во вкладке **Repository Url** вписываем ссылку на **GitHub** репозиторий
- Так как репозиторий публичный, вкладку **Credentials** пропускаем
- Во вкладке **Branch Specifier** указываем основную ветку (в моем случае ***/master**)
- Во вкладке **Script path** указываем название **Jenkinsfile** в вашем **GitHub** репозитории (в моем случае он называется **Jenkinsfile**)

#### Ссылка на **Dockerhub**: *https://hub.docker.com/u/alisheradylov*

### P.S
Здравствуйте! К сожалению, **я не успел доделать все задания**. Мне было очень интересно попробовать себя в соверешенно новой обстановке, до этого ни разу не работал с **Jenkins, SAST – Semgrep, SCA – Dependency Check, Container Scanning – Trivy, DAST – OWASP ZAP**, да и в целом с DevOps инструментами я был знаком только в теории, но мне было интересно изучать это. Я обязательно попробую доделать этот проект.

### Спасибо вам огромное, что дали мне такой опыт! Благодаря этому хакатону, я понял, что действительно хочу заниматься разработкой CI/CD пайплайнов и теперь с еще большей мотивацией обязательно буду учиться дальше! ❤️❤️❤️
