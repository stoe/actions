FROM node:8

LABEL "maintainer"="stoe <stefan@stoelzle.me>"
LABEL "repository"="https://github.com/stoe/actions"
LABEL "homepage"="https://github.com/stoe/actions"
LABEL "version"="1.0.0"

LABEL "com.github.actions.name"="github-migration-playbooks"
LABEL "com.github.actions.description"="Create PDF using gitbook"
LABEL "com.github.actions.icon"="book"
LABEL "com.github.actions.color"="gray-dark"

# install calibre dependencies
RUN apt-get update && \
    apt-get install -y calibre && \
    apt-get clean && \
    rm -rf /var/cache/apt/* /var/lib/apt/lists/*

# install gitbook-cli
RUN npm install gitbook-cli -g

# install gitbook version
RUN gitbook fetch 3.2.3

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
