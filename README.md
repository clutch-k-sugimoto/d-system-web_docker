# ローカル開発環境@docker for CakePHP2.x

## 概要
d-systemのweb環境をdockerで作ってみた。  
しかして、Laravelまでの命  
<br>

## 初めにやること
1. 適当な場所へgitからソースをcloneする。  
    ```
    git clone https://github.com/clutch-main-jet/d-system-web.git
    ```  
<br>

2. app配下にフォルダを作成する。  
    permissionやらusergroupやらの変更はDockerfileで行うので作るだけでおｋ。  
    ```
    mkdir -p app/tmp/cache/cache_data
    mkdir -p app/tmp/cache/db_cache
    mkdir -p app/tmp/cache/less
    mkdir -p app/tmp/cache/modules
    mkdir -p app/tmp/cache/models
    mkdir -p app/tmp/cache/persistent
    mkdir -p app/tmp/cache/views
    ```
<br>

3. CakePdfをインストールする。  
CakePHP2.xは1.0.3しかサポートされていないというGoogle先生の教えに従った結果
    ```
    git clone https://github.com/FriendsOfCake/CakePdf -b 1.0.3 app/Plugin/CakePdf
    ```  
<br>

4. DebugKitをインストールする。  
このバージョンが合っているかどうか要検証
    ```
    git clone https://github.com/cakephp/debug_kit -b 2.2 app/Plugin/DebugKit
    ```
