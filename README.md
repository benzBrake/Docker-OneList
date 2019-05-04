# Docker-OneList

Docker image of [OneList](https://github.com/benzBrake/Docker-OneList)

## Get Started

### Create a config file

```json
{
  "token": "<refresh_token>",
  "location_path": "/",
  "start_directory": "/",
  "threads": 3,
  "diff_seconds": 480,
  "refresh_seconds": 720,
  "metadata_cached_seconds": 768,
  "structure_cached_seconds": 840
}
```

Then run it by command:

```shell
# docker run -v /data/OneList/config.json:/root/OneList/config.json -p 5000:5000 benzbrake/onelist
```

### How to get refresh_token

Click this link on your computer browser, login with your sharepoint account, then your browser would be redirected to show the refresh_token:

> <https://login.microsoftonline.com/common/oauth2/authorize?response_type=code&client_id=ea2b36f6-b8ad-40be-bc0f-e5e4a4a7d4fa&redirect_uri=https://api.moeclub.org/onedrive-login>

## Run by docker-compose

Create  `docker-compose.yml` and create `config.json` 

example of `docker-compose.yml`,

```yaml
version: '3'

services:
  onelist:
    image: benzbrake/onelist
    container_name: onelist
    restart: always
    volumes:
      - /data/config.json:/root/OneList/config.json
    ports:
      - 5000:5000
```

Then use command`docker-compose [-f location of docker-compose.yml] up -d ` to run OneList.

BTW, you can change the location of config as you want.

## License

Copy as you want.





