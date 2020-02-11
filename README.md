# Noxel

# アプリ概要
Noxelは小説とイラストを投稿し気に入った小説やイラストがあればメッセージでやり取りする  
作家とイラストレーターを繋げるプラットフォームです。  
# 作った経緯
私はウェブ小説を読むのが好きなのですが、ウェブ小説にはイラストがないことが多く
イラストがあればイメージが湧いてさらに面白くなるのにと感じることが多いです。  
そこで作家がいいなと思ったイラストレーターにイラストを依頼できたり
逆にイラストレーターも気に入った作品があればイラストを提供できるようなプラットフォームがあれば  
web小説業界はさらに盛り上がっていくのではないかと考えて作成しました。  
アプリ: http://3.114.132.40  
* ログイン画面にあるデモボタンを押すとテストユーザーとしてログインできます。
![home](https://user-images.githubusercontent.com/51396383/66777923-384dab80-ef05-11e9-9ee2-96e84c1e7059.png)

# 使用した技術やGem
* ruby 2.5.0  
* Ruby on Rails 6.0.0  
  * active_storage(画像アップロード)  
  * action_text(リッチなテキストエディタ機能)  
* JavaScript  
* jQuery  
* bootstrap4  
* MySQL 5.7  
* AWS  
  * EC2  
  * VPC  
  * S3  
  * WEBサーバー: Nginx   
* Docker
* docker-compose
* CircleCI

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
* ブックマーク,感想が多い順のランキング機能  
* 小説の検索機能  
* タグ機能  

# アーキテクチャ
<img width="778" alt="アーキテクチャ" src="https://user-images.githubusercontent.com/51396383/74080147-0ea42b80-4a84-11ea-97f1-2aadff1c6ca7.png">
