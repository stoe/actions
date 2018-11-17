FROM python:2.7-slim

LABEL "maintainer"="stoe <stefan@stoelzle.me>"
LABEL "repository"="https://github.com/stoe/actions"
LABEL "homepage"="https://github.com/stoe/actions"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="ansible-playbook"
LABEL "com.github.actions.description"="Run Ansible Playbook"
LABEL "com.github.actions.icon"="play"
LABEL "com.github.actions.color"="gray-dark"

RUN pip install ansible

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
