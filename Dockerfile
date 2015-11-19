FROM alpine

ENV JAVA_VERSION=8 JAVA_UPDATE=66 JAVA_BUILD=17 

RUN apk upgrade --update && \
    apk add curl ca-certificates tar && \
    curl --progress-bar -o glibc-2.21-r2.apk https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-2.21-r2.apk && \
    curl --progress-bar -o glibc-bin-2.21-r2.apk https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64/glibc-bin-2.21-r2.apk && \
    apk add --allow-untrusted glibc-2.21-r2.apk glibc-bin-2.21-r2.apk && \
    /usr/glibc/usr/bin/ldconfig /lib /usr/glibc/usr/lib && \
    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    curl --progress-bar -jkSLH "Cookie: oraclelicense=accept-securebackup-cookie"\
     http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION}u${JAVA_UPDATE}-b${JAVA_BUILD}/server-jre-${JAVA_VERSION}u${JAVA_UPDATE}-linux-x64.tar.gz\
      -o jre-8u66-linux-x64.tar.gz