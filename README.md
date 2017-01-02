# Youtrack docker
Docker image for Youtrack

- Version: 7.0.29566
- For importing data from my older seti/docker-youtrack just use the same Data Dir and select the "upgrade procedure" on first start in webinterface.


---
Usage example
===
### Needed directories on host:
- data

```bash
NAME="youtrack"
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
mkdir $DIR/data
chown 1000:1000 $DIR/data
docker run -d \
	-m 2g \
	-v $DIR/data:/data \
	-e BASE_URL=[your URL] \
	--name $NAME  \
	-p 8080:8080 \
	--restart=always \
	seti/youtrack
```
