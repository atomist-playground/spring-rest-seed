FROM openjdk:8

RUN /bin/ls -al /kaniko \
  && /bin/ls -al /kaniko/.docker \
  && /bin/cat /kaniko/.docker/config.json

LABEL maintainer="Atomist <docker@atomist.com>"

RUN mkdir -p /app

WORKDIR /app

EXPOSE 8080

CMD ["-jar", "spring-boot.jar"]

ENTRYPOINT ["java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-Xmx256m", "-Djava.security.egd=file:/dev/urandom"]

COPY target/spring-boot.jar spring-boot.jar
