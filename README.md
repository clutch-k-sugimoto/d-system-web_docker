# ローカル開発環境@docker for CakePHP2.x

## 概要
リモートで構築されているd-system-webのローカル版です。 

しかして、Laravelへのマイグレーション完了までの命  
<br>
<br>

## 構成
php 7.3-apache（Debian 10.0 "Buster"）  
mariadb 10.4  
Adminer (いらない場合はコメントアウトしてください。)  
CakePHP2（プロジェクトにインストール済み）  
<br>
<br>

## 初めにやること
1. 適当な場所へgitからソースをcloneする。  
    ```
    git clone git@github.com:clutch-main-jet/d-system-web.git
    ```  
<br>

2. 同じ場所にこのリポジトリをcloneする。  
    ```
    git clone https://github.com/clutch-k-sugimoto/d-system-web_docker.git
    ```  
<br>

3. Dockerベースへ移動。  
    例）ホームディレクトリのworkに作った場合
    ```
    cd ~/work/d-system-web_docker
    ```
<br>

4. Docker コンテナ構築 ＆ 起動  
    数分かかります。
    VisualStudioCodeでのdocker操作を知ってるならそっちで。
    ```
    doccker-compose up
    ```
<br>

5. アプリサーバへ入る  
    初期処理実行のため、アプリサーバへログインします。
    ```
    docker exec -it d-system_web bash
    ```
<br>

6. 初期処理実行  
    数分かかります。  
    ```
    init.sh
    ```
    完了したらログアウト。  
    ```
    exit or ctrl + d
    ```
<br>

7. DB接続先書き換え  
    app/Config/database.phpのdefaultを以下に書き換え。  
    ユーザはrootを指定していますが、特定のユーザにしたい場合はdocker-composeのenvironmentを適宜個人で追加/変更してください。  
    ```
	public $default = array(
        'datasource' => 'Database/Mysql',
        'persistent' => false,
        'host' => 'd-system_mariadb',
        'login' => 'root',
        'password' => 'd-system',
        'database' => 'd-system',
        'prefix' => '',
        'encoding' => 'utf8mb4',
	);
    ```
<br>

8. DBにデータを流し込む  
    ダンプデータをDBに流し込む。  
    事前にダンプファイルを入手しておくこと。（死ぬほどでかいファイルなので誰かからもらってください）  
    パスワードを聞かれたら7に記載されているもので。  
    例）  
    ```
    mysql -P 3306 -h 127.0.0.1 -u root -p d-system < ./d-system-web_docker/mariadb/dumptemp.sql
    ```
<br>

9. ログイン  
    これで使用可能（になるはず）  
    ```
    http://localhost:8080  
    ```
<br>
<br>

## やっておいたら便利なやつ  


### xdebugを使う  


好きな箇所にブレークポイントを置いてステップ実行ができるようになります。  
サーバには追加済み  


以下の手順を、d-system_webを開いているVSCodeプロジェクトに追加してください。  


1. VSCodeの拡張機能タブ（Ctrl + Shift + X）から、`PHP Debug`を検索してインストール。


2. VSCodeのデバッグタブ（Ctrl + Shift + D）から、`「launch.jsonファイルを作成します」`をクリック。


3. 環境の選択タブが表示されるので、`PHP`を選択。


4. 作成されたファイルの中身全部を以下に書き換え。  
    ```
    {
        "version": "0.2.0",
        "configurations": [
            {
                "name": "d-system_web",
                "type": "php",
                "request": "launch",
                "port": 9003,
                "stopOnEntry": true,
                "pathMappings": {
                    "/var/www/html": "${workspaceFolder}"
                },
                "ignore": [
                    "**/vendor/**/*.php"
                ]
            }
        ]
    }    
    ```
<br>
<br>

## その他 リモート環境と違うことによる気になる点など
* ローカルはhttpsではなくhttpだがなんか問題あるか
* Pluginを自力で引っ張ってきていることによるバージョンの差異で不具合が出るか
* app/vendor配下が何故かgitに登録されているため、`composer install(update)`を行うと大量の差分が発生する。repoから消すのが理想だが・・・
* あとは気がついたら追記する
