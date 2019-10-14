# Noxel

Noxelは作家とイラストレーターを繋げるサービスです。転職用のポートフォリオとして作りました

# アプリ本体

http://3.114.132.40  

(img width="1435" alt="スクリーンショット 2019-10-15 4 30 41" src="https://user-images.githubusercontent.com/51396383/66777923-384dab80-ef05-11e9-9ee2-96e84c1e7059.png")

# テストユーザーとしてログイン

ログイン画面にあるデモボタンを押すとテストユーザーとしてログインしてください。

# 使用した技術, Gem
* ruby 2.5.0  
* Ruby on Rails 6.0.0  
  * active_storage(画像アップロード)  
  * action_text(リッチなテキストエディタ機能)  
* bootstrap4  
* MySQL 5.7  
* AWS  
  * EC2  
  * VPC  
  * WEBサーバー: Nginx   
* Docker  

使用したGem一覧
* kaminari  
* bcrypt  
* mini_magick  

# 機能一覧
* ユーザー登録、ログイン機能  
* ユーザー間でのフォロー、フォロワー機能(ボタンにajax)   
* ユーザーのプロフィール画像変更(Gravatar)  
* DM機能(ルームを作りその中でチャットする)  
* 小説のタイトルの投稿(CURD)  
* 作った小説に話数を作る機能(CURD)  
* ブックマーク機能(ボタンにajax)  
* 感想投稿機能(CURD)  
* イラスト(画像)投稿機能(CURD)  
* ページネーション機能(kaminari)  
* ブックマークが多い順のランキング機能  
* 小説の検索機能  

# 開発環境
MacBookpro上でDocker環境での開発を行なっています。  
[Dockerfile](/Dockerfile)とpidファイルが残っていて起動できないケースを防ぐ為の[entrypoint.sh](/entrypoint.sh)それらを起動する[Docker-compose.yml](/Docker-compose.yml)で構成されています。
