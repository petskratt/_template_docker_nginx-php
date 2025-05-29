# Sample Docker project with nginx and php-fpm
v0.1 2025-05-29 pets@tehnokratt.net

Base project that works for my preferences:

* Nginx conf with templates, CSP and other nice headers, Real-IP (inc sample for Cloudflare)
* PHP-FPM with some security settings
* running rootless

PROJECTNAME='somecoolname' && git init $PROJECTNAME && cd $PROJECTNAME && git pull --depth 1 https://github.com/petskratt/_template_docker_nginx-php.git