FROM php:7.3-apache

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
  git \
  zip \
  unzip \
  vim \
  wget \
  fontconfig \
  wkhtmltopdf \
 && apt-get autoremove \
 && apt-get clean

RUN docker-php-ext-install pdo_mysql mysqli

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

ENV PATH="${PATH}:/var/www/html/lib/Cake/Console"
ENV PATH="${PATH}:/var/www/html/app/Vendor/bin"

COPY ./apache/conf/virtualhost.conf /etc/apache2/sites-available/000-default.conf
COPY ./apache/conf/php.ini /usr/local/etc/php/

RUN mkdir -p /var/www/html/app/tmp/logs

RUN git clone https://github.com/FriendsOfCake/CakePdf -b 1.0.3 app/Plugin/CakePdf
RUN git clone https://github.com/cakephp/debug_kit -b 2.2 app/Plugin/DebugKit
RUN git clone https://github.com/Hyra/less.git app/Plugin/Less
RUN git clone https://github.com/leafo/lessphp.git app/Plugin/Less/Vendor/lessphp

RUN chown -R www-data:www-data \
  /var/www/html/app/tmp/ \
  && chmod -R 777 \
  /var/www/html/app/tmp/

RUN a2enmod rewrite \
  && service apache2 restart

EXPOSE 80
