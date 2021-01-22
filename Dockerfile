
FROM adoptopenjdk/openjdk11:latest


ARG UNAME=testuser
ARG UID=1000
ARG GID=1000
RUN groupadd -g $GID -o $UNAME
RUN useradd -m -u $UID -g $GID -o -s /bin/bash $UNAME
USER $UNAME
RUN echo $HOME
WORKDIR /home/testuser
RUN mkdir -p logs
COPY target/spring-petclinic-data-jdbc-2.1.0.BUILD-SNAPSHOT.jar app.jar
USER root
RUN chown ${UNAME}:${GID} app.jar && \
    chmod 744 app.jar
USER $UNAME   
CMD ["java", "-jar", "app.jar"]