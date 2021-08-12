# ローカル開発環境@docker for CakePHP2.x

## 概要
リモートで構築されているd-system-webのローカル版です。 

しかして、Laravelへのマイグレーション完了までの命  
<br>

## 構成
php 7.3-apache（Debian 10.0 "Buster"）  
mariadb 10.4  
phpmyadmin (Optional)  
CakePHP2（プロジェクトにインストール済み）  
<br>

## 初めにやること
1. 適当な場所へgitからソースをcloneする。  
    ```
    git clone https://github.com/clutch-main-jet/d-system-web.git
    ```  
<br>

2. プロジェクトのベースへ移動。  
    例）ホームディレクトリのworkに作った場合
    ```
    cd ~/work/d-system-web
    ```
<br>

4. Docker コンテナ構築 ＆ 起動  
    VisualStudioCodeでのdocker操作を知ってるならそっちで。
    ```
    doccker-compose up
    ```
5. １〜２分待つ  
    entrypointで初期設定のシェルを走らせているため、起動から少し待つ必要がある。
