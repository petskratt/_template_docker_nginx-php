# Sample Docker project with nginx and php-fpm

v0.2 2024-08-21 pets@tehnokratt.net

Base project that works for my preferences:

* Nginx or Mod Security CRS conf with templates, CSP and other nice headers, Real-IP (inc sample for Cloudflare)
* PHP-FPM with some security settings
* running rootless

PROJECTNAME='somecoolname' && git init $PROJECTNAME && cd $PROJECTNAME && git pull --depth 1 https://github.com/petskratt/_template_docker_nginx-php.git

## Changelog

v0.2 2024-08-21 works with nginx and owasp-crs images (only change in .env needed)
v0.1 2024-05-29 initial version