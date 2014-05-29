# play-example
#
# VERSION               0.0.1

FROM      ubuntu:14.04

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y --no-install-recommends git default-jdk htop unzip wget

#===install sbt
RUN wget http://apt.typesafe.com/repo-deb-build-0002.deb
RUN dpkg -i repo-deb-build-0002.deb
RUN wget http://dl.bintray.com/sbt/debian/sbt-0.13.2.deb
RUN dpkg -i sbt-0.13.2.deb
RUN mkdir -p /root/.sbt/.lib/0.13.1/ 
RUN wget -O /root/.sbt/.lib/0.13.1/sbt-launch.jar http://typesafe.artifactoryonline.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/0.13.1/sbt-launch.jar

# create a distribution from the source
RUN git clone https://github.com/nemoo/play-slick-example.git
RUN cd /play-slick-example && sbt dist
RUN unzip /play-slick-example/target/universal/test-1.0-SNAPSHOT.zip

CMD test-1.0-SNAPSHOT/bin/test -DapplyEvolutions.default=true

EXPOSE 9000