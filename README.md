# Humhub

A social network without Big Brother

MariaDB is configured with a **humhub** database with a **humhub** user with a **HuMhUb** password

## Howto

Just build it ...

```docker build -t adminrezo/humhub .```

... run it ...

```docker run --name humhub -d adminrezo/humhub && docker inspect humhub |grep IPAddress```

... enjoy it !

https://your-container-ip/
