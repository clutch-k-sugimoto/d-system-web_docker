FROM php:7.3-apache

# apt-getでいるやつ諸々インストール
RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
  git \
  zip \
  unzip \
  vim \
  wget \
  fontconfig \
  wkhtmltopdf \
  zlib1g-dev \
  libpng-dev \
  libzip-dev \
  autoconf \
 && apt-get autoremove \
 && apt-get clean

# PHP Extention諸々インストール
RUN docker-php-ext-install pdo_mysql mysqli gd zip

# gRPCのインストール と 有効化（こいつが死ぬほど長い）
RUN pecl install grpc
RUN docker-php-ext-enable grpc

# Composerインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

# CakePHPとComposer環境変数追加
ENV PATH="${PATH}:/var/www/html/lib/Cake/Console"
ENV PATH="${PATH}:/var/www/html/app/Vendor/bin"

# virturlhostの設定を転送 （Apache2のため、本家とはちょっと違う）
COPY ./apache/conf/virtualhost.conf /etc/apache2/sites-available/000-default.conf

# PHPの設定ファイル転送
COPY ../apache/conf/php.ini /usr/local/etc/php/php.ini

# 初期設定シェルを転送 & パーミッション変更（雑）
COPY ./init.sh /usr/local/bin
RUN chmod 777 /usr/local/bin/init.sh

# Apache2のログ出力フォルダを予め作っておく。
# このあとのマウントで上書きされてしまうが、コンテナへ先に作っておかないとApacheに怒られる
RUN mkdir -p /var/www/html/app/tmp/logs

# Apache2設定反映 ＆ 再起動
RUN a2enmod rewrite \
  && service apache2 restart

# entrypointで初期処理やろうとしたけど、終わりがわからん上にエラーがあってもわからんのでヤメ。
# CMD docker-php-entrypoint init.sh && apache2-foreground

EXPOSE 80
