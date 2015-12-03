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
- In in `/etc/php5/(apache2|cli)/php.ini`, increase the `memory_limit` directive to at least `128M` and the `upload_max_filesize` AS WELL AS the `post_max_size` directive to your desired maximum file upload size.
- Make sure that there is no file `XX-xcache.ini` in `/etc/php5/(apache2|cli)/conf.d/`.
- Also, see [here](https://www.humhub.org/docs/guide-admin-installation.html#4-fine-tuning). Already taken care of by the Dockerfile are cron jobs.

## Turnkey Backup et Migration
- Since the basis of this image is Turnkey Linux, the automated backup tool [TKLBAM](https://www.turnkeylinux.org/docs/tklbam) is available out of the box.
- If you use TKLBAM, make sure to include any SSL-Certificates in the backup, otherwise the apache server will not start if you restore the backup to another machine. In the current setup, you need to add `/humhub/data/*.crt` and `/humhub-data/*.key` to `/etc/tklbam/overrides`. 
