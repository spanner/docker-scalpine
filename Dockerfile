FROM jonjack/jalpine

ENV SCALA_VERSION 2.11.7

RUN apk upgrade --update && \
    apk add curl tar bash && \
    curl --progress-bar -jkSL http://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz | tar -xzf - -C /opt && \
    mv /opt/scala-${SCALA_VERSION} /opt/scala && \
    chown -R root: /opt/scala && \
    rm -rf /var/cache/apk/*

ENV SCALA_HOME /opt/scala
ENV PATH ${PATH}:${SCALA_HOME}/bin