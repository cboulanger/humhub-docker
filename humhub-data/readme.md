If you have data from an existing humhub installation that you want to migrate
to this container, here's how:

- create a dump of the old data with
  `mysqldump -u<user> -p<password> <name of db> > humhub.sql`
  and place `humhub.sql` in the `humhub-data` folder

- create a zipped tarball of the `uploads` folder:
  `tar -czf uploads.tgz /path/to/humhub/uploads`
  and place `uploads.tgz` in thein the `humhub-data` folder

- if you have SSL certificates on the site, place the files in this folder, too,
  named
  - `certificate.crt` The domain certificate
  - `certificate.key`  The private key
  - `chain.crt`  The certificate chain
