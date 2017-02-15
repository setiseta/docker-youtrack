#!/bin/sh

if [ ! -e $APP_HOME/conf ];
then
	echo "first run: starting configure"
	cp -rp /opt/youtrack/conftemplate $APP_HOME/conf
	ln -s $APP_HOME/conf /opt/youtrack/conf
	bin/youtrack.sh configure \
		--backups-dir $APP_HOME/backups \
		--data-dir    $APP_HOME/data \
		--logs-dir    $APP_HOME/log \
		--temp-dir    $APP_HOME/tmp \
		--listen-port 8080 \
		--base-url    http://$BASE_URL/
else
	rm -rf /opt/youtrack/conf
	ln -s $APP_HOME/conf /opt/youtrack/conf
fi

bin/youtrack.sh run
