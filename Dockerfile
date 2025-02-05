FROM openjdk:8-jre
LABEL maintainer "Mike Tallroth <mike.tallroth@gmail.com>"

ENV VERSION=7.3.0.19

RUN curl -o /cmd.run.zip http://cdn.sencha.com/cmd/$VERSION/no-jre/SenchaCmd-$VERSION-linux-amd64.sh.zip && \
    unzip -p /cmd.run.zip > /cmd-install.run && \
    chmod +x /cmd-install.run && \
    /cmd-install.run -q -Dall=true -dir /opt/Sencha/Cmd/$VERSION && \
    install -dm777 -o root -g root /opt/Sencha/Cmd/repo && \
    rm /cmd-install.run /cmd.run.zip && \
    ln -s /opt/Sencha/Cmd/$VERSION/sencha /opt/Sencha/sencha && \
    apt-get update && apt-get install -y --no-install-recommends \
        ruby \
        libffi6 \
        build-essential \
        ruby-dev \
        libffi-dev && \
    gem update --system && \
    gem install compass && \
    apt-get remove -y ruby-dev build-essential libffi-dev && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* 

WORKDIR /framework

RUN /opt/Sencha/sencha generate app -ext Framework .
RUN chmod -R a+rw /opt/Sencha/Cmd/repo

WORKDIR /code

ENTRYPOINT ["/opt/Sencha/sencha"]
