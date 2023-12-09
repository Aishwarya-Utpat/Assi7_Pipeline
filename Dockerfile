FROM openjdk:latest
WORKDIR /usr/src/app
COPY HelloWorld.java .
RUN ["Javac","HelloWorld.java"]
ENTRYPOINT ["Java","HelloWorld"]
