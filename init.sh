#!/bin/sh

set -eu

# 開始メッセージ
echo '*************** init.sh start ***************'

# ２度実行できないためのもの
if [ -e '/usr/local/bin/init.lock' ]; then
echo '*************** init.sh already executed !! ***************'
  exit
fi

# tmp以下フォルダ作成
mkdir -p /var/www/html/app/tmp/cache/cache_data
mkdir -p /var/www/html/app/tmp/cache/db_cache
mkdir -p /var/www/html/app/tmp/cache/less
mkdir -p /var/www/html/app/tmp/cache/modules
mkdir -p /var/www/html/app/tmp/cache/models
mkdir -p /var/www/html/app/tmp/cache/persistent
mkdir -p /var/www/html/app/tmp/cache/views

# オーナー変更とパーミッション変更
chown -R www-data:www-data /var/www/html/app/tmp/
chmod -R 777 /var/www/html/app/tmp/

# プラグイン一式インストール
git clone https://github.com/FriendsOfCake/CakePdf -b 1.0.3 /var/www/html/app/Plugin/CakePdf
git clone https://github.com/cakephp/debug_kit -b 2.2 /var/www/html/app/Plugin/DebugKit
git clone https://github.com/Hyra/less.git /var/www/html/app/Plugin/Less
git clone https://github.com/leafo/lessphp.git /var/www/html/app/Plugin/Less/Vendor/lessphp

# composerはlockファイルがプロジェクトに存在するので、installではなくupdateとする
cd /var/www/html
composer update

cd /var/www/html/app
composer update

# ２度実行禁止フラグ的な空ファイル
touch /usr/local/bin/init.lock

# 終了メッセージ
echo '*************** init.sh end ***************'
