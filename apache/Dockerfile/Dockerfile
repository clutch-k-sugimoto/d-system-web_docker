FROM php:7.3-apache

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
  git \
  zip \
  unzip \
  && rm -rf /var/lib/apt/lists

# Enable PHP extensions
RUN docker-php-ext-install pdo_mysql mysqli

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# Add cake and composer command to system path
ENV PATH="${PATH}:/var/www/html/lib/Cake/Console"
ENV PATH="${PATH}:/var/www/html/app/Vendor/bin"

# COPY file
COPY ./apache/conf/virtualhost.conf /etc/apache2/sites-available/000-default.conf
COPY ./apache/conf/php.ini /usr/local/etc/php/

RUN mkdir -p /var/www/html/app/tmp/logs

#COPY ./apache/entrypoint.sh /tmp/entrypoint.sh
#RUN chmod 777 /tmp/entrypoint.sh
# Create tmp directory and make it writable by the web server
RUN chown -R www-data:www-data \
  /var/www/html/app/tmp/ \
  && chmod -R 777 \
  /var/www/html/app/tmp/

# Enable Apache modules and restart
RUN a2enmod rewrite \
  && service apache2 restart

EXPOSE 80
