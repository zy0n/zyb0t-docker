# zyb0t-docker

### Prerequisites

```
Gunbot License
Zyb0t License - contact @zy0nbear on telegram.
```

### Installing

Create docker-compose.yml file

```sh
touch docker-compose.yml
nano docker-compose.yml

```
copy + paste the one provided below.

*docker-compose.yml*
```yml
volumes:
  data:

services:
  gunbot:
    platform: linux/amd64
    stdin_open: true # docker run -i
    tty: true 
    image: zy0nbear/gunbot:latest
    command: "/opt/gunbot/install.sh"
    ports: 
      - 3001:5000
    volumes:
      - data:/data

    
  zyb0t:
    depends_on:
      - gunbot
    platform: linux/amd64
    stdin_open: true # docker run -i
    tty: true 
    image: zy0nbear/zyb0t:latest
    command: "/opt/zybot/install.sh"
    volumes:
      - data:/data

```

Run docker-compose.yml 

```sh
docker compose -f 'docker-compose.yml' up -d --build
```

This will launch gunbot and zyb0t dockers.
Gunbot can be visited on localhost @ https://localhost:3001

## Usage <a name = "usage"></a>

Once gunbot is configured, and your exchanges have been added.
Log into the container running zybot's terminal.

After you've connected to the container running zybot, Go to the storage location of zybot.
And run. This will run you through the initial setup and generation of your zybot config file.



```sh
cd /data/gunthy_linux/zybot
./zyb0t-linux
```
```sh
# Get a bot token from @BotFather on telegram
# Get your TG ID from @myidbot
# Generate a unique zyb0t account name for yourself. 
```

## When asked about gunbot directory
Enter this:
```sh
/data/gunthy_linux
```

Once the installer finishes and exits, restart the container. 