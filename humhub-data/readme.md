If you have data from an existing humhub installation that you want to migrate
to this container, here's how:

- create a dump of the old data with
  `mysqldump -u<user> -p<password> <name of db> > humhub.sql`
  and place `humhub.sql` in this folder

- create a zipped tarball of the `uploads` folder:
  `cd /path/to/humhub/uploads; tar -czf uploads.tgz ./uploads`
  and place `uploads.tgz` in this folder

- then run `docker build`.

Once the data is in a container, you can easily export it with the `/export.sh` script. The resulting files are placed into the folder `/tmp/humhub-data` and can be transferred to this folder before running `docker build`.

If you have SSL/TLS certificates for the site that should be installed, place the files in this folder, too, named
  - `certificate.crt` The domain certificate
  - `certificate.key`  The private key
  - `chain.crt`  The certificate chain
