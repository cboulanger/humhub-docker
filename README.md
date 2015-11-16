# Humhub

This creates a [Docker](http://www.docker.com) image of the [Humhub](https://www.humhub.org) Social Network Kit.

This is a fork of [adminrezo/docker-humhub](https://hub.docker.com/r/adminrezo/docker-humhub/), using a [Turnkeylinux LAMP](https://www.turnkeylinux.org/lampstack) [base image](https://hub.docker.com/r/cboulanger/turnkeylinux-lamp/).

MySql is configured with a **humhub** database with a **humhub** user with a **HuMhUb** password

## Howto

Build it:

```docker build -t cboulanger/humhub-docker .```

an run it:

```docker run --name humhub -d cboulanger/humhub-docker && docker inspect humhub | grep IPAddress```

## Data migration

You can also [migrate data from and to a different container](humhub-data/readme.md).

## Post-Installation steps:
- Increase the memory_limit directive in `/etc/php5/(apache2|cli)/php.ini` to at least `128M`.
- Make sure that there is no file `XX-xcache.ini` in `/etc/php5/(apache2|cli)/conf.d/`.
