FROM php:5.6-apache

# enable Apache virtual hosts; see virtual-hosts.conf
COPY virtual-hosts.conf /etc/apache2/conf-available/virtual-hosts.conf
RUN  a2enconf virtual-hosts

# global PHP overrides; see php.ini
# remove this line if you don't need to override anything
COPY php.ini /usr/local/etc/php/

# This line is required; it copies the root of this project to the location
# inside the Docker container where Apache is looking
COPY ./ /var/www/html/
