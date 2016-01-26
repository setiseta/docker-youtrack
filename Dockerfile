FROM java:latest

MAINTAINER Seti <seti@setadesign.net>

ENV APP_VERSION 6.5
ENV APP_BUILD $APP_VERSION.17015
ENV APP_HOME /data

RUN curl -L https://download.jetbrains.com/charisma/youtrack-$APP_BUILD.zip -o /opt/youtrack.zip && \
	mkdir /opt/youtrack -p && cd /opt/youtrack/ && \
	unzip /opt/youtrack.zip && \
	rm -f /opt/youtrack.zip && \
	rm -rf /opt/youtrack/internal/java && \
	mkdir $APP_HOME && \
	groupadd -r youtrack && \
	useradd -r -g youtrack -u 1000 -d $APP_HOME youtrack && \
	chown -R youtrack:youtrack $APP_HOME /opt/youtrack

WORKDIR /opt/youtrack
ADD run.sh /opt/youtrack/
RUN chmod o+rx run.sh
USER youtrack
ENTRYPOINT ["/opt/youtrack/run.sh"]
EXPOSE 8080
VOLUME ["$APP_HOME"]
