# README

**概要**
* * *
「これが欲しくて探しています！」と、「持っているよ。譲ってあげるよ」を結ぶプラットホーム。
検索のしやすいアプリを目指している。

**背景**
* * *
自分にとって不要なものをフリマアプリで出品した際、「ずっとこれを探していたんです」と喜ばれる経験を何度かしたことがある。
しかし、自分自身が欲しくて探しているものはフリマアプリで探しても見つからないことも多い。
そこで探している物について声をあげられる場があれば良いと思い、その場を作りたいと思った。

**バージョン**
* * *
* Ruby 2.6.5
* Rails 5.2.4
* Postgresql

**機能一覧**
* * *
* ログイン機能
* ユーザ登録・編集機能
* 探し物投稿作成・編集・削除機能
  * カテゴリーラベル追加機能
  * 探し物完了表示機能
* 探し物投稿一覧表示機能
* コメント投稿機能(Ajax)
* 通知機能
  * 通知一覧表示機能
* 検索機能
* ブックマーク機能

**カタログ設計・テーブル定義・ER図**
* * *
https://docs.google.com/spreadsheets/d/1fyQG1ezcqpEGZIyQk-tdqOsU8Fk2ZGunQ8SexpLqboY/edit?usp=sharing

**画面遷移図**
* * *
https://docs.google.com/spreadsheets/d/1hIwMKDz5pcJUkes40VdGWbuoCxyJAz-gWEfsVQwlsPY/edit?usp=sharing

**ワイヤーフレーム**
* * *
https://docs.google.com/spreadsheets/d/1nccOCEtorkDBOiXfv4UVzcn0i0rKVta_MtfGpqzKUj8/edit?usp=sharing

**使用予定gem**
* * *
* devise
* ransack
* carrierwave
* mini_magic
* rails_admin
* cancancan
* bootstrap 4
* kaminari
* pry-rails
* better_errors
