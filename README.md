# アプリケーション名
「my猫日誌」
<br />
<br />

# アプリケーション概要
猫の体調管理、飼育をサポートする日記アプリ
## 主な機能
### 1. ご飯記録機能
- 前日の食べ残し量が、前日のデータから自動入力される
- 朝昼晩の追加量、その日の食べ残し量が入力できる
- 入力された上記の値から、その日に食べた量が自動計算される
### 2. 日記機能
- 毎日の日記を作成、編集できる
- 画像投稿ができる(**ActiveStrage**, **Ajax**)
- コメント、体重が記録できる
- ご飯記録で計算された、その日に食べた餌の量が表示される
### 3. 買い物リスト機能
- 買いたい猫用の備品をリスト化できる(**Ajax**)
- 購入したらリストから削除できる(**Ajax**)
### 4. ユーザ管理機能
- 新規登録、ログイン機能が利用できる(**devise**)
<br />

# URL
http://35.74.24.200
<br />
<br />

# テスト用アカウント
### Eメール
  user@mail.com
### パスワード
  user123
<br />
<br />

# 制作背景(意図)
以下の課題を解決したいと思い、本アプリを作成した
### 課題1. 
飼い猫の体調にはしっかり気を使ってあげたいが、忙しくて時間に余裕がないときはそれが出来ているか不安である
### 課題2. 
飼い猫がマイペースに餌を食べるため、決まった時間にあげようとしてもお皿の中身が残っているときがある<br>
お皿が空になったタイミングで追加をしていると、今日はどれくらい餌をあげたか、どれくらい食べてくれたのか把握しにくい
### 課題3. 
猫のトイレの砂やキャットフードのストックが少ないことに気付きながらも買い忘れてしまい、必要な時に足りない、という事態が発生してしまう
<br />
<br />

# DEMO(各機能利用方法)
## 1. ご飯記録機能

- ### ご飯記録作成機能
 1. トップページで「ご飯を記録する」をクリックする<br>※ すでにその日のご飯記録が作成済みの場合、「ご飯記録を更新する」ボタンが表示される
 2. 各項目を入力して「保存」をクリックする<br>※ 「昨日の残り」は、前日記録したデータが自動入力される
 3. トップページが「ご飯記録を更新する」に変わる
[![Image from Gyazo](https://i.gyazo.com/dd73669687667dbf87a9dfc9140c3338.gif)](https://gyazo.com/dd73669687667dbf87a9dfc9140c3338)

- ### ご飯記録更新機能
 1. トップページで「ご飯記録を更新する」をクリックする
 2. 各項目を入力して「保存」をクリックする
[![Image from Gyazo](https://i.gyazo.com/0c202dbe5e75922594d07392ca6ab80f.gif)](https://gyazo.com/0c202dbe5e75922594d07392ca6ab80f)
<br />

## 2. 日記機能
- ### 日記作成機能
1. トップページで「今日の日記を作成する」をクリックする<br>※ すでにその日の日記が作成済みの場合、「今日の日記を編集する」ボタンが表示される
2. 「画像」、「今日のメモ」、「体重」を入力する<br>※ 画像は５枚までアップロード可能
3. 「食べた餌の量」にはご飯記録機能で入力したデータの計算結果が表示される
4. ご飯記録を作成する（更新する）をクリックするとご飯記録の作成または更新ができる
5. 保存ボタンをクリックする
[![Image from Gyazo](https://i.gyazo.com/37185ae38dc0a214abd4faab248a97ea.gif)](https://gyazo.com/37185ae38dc0a214abd4faab248a97ea)

- ### 日記編集機能
1. トップページで「今日の日記を編集する」をクリックする
2. 「画像」、「今日のメモ」、「体重」を編集する<br>※ 画像は新たに追加ができ、また既に投稿済みのものは削除ができる
3. 「食べた餌の量」にはご飯記録機能で入力したデータの計算結果が表示される
4. ご飯記録を作成する（更新する）をクリックするとご飯記録の作成または更新ができる
5. 保存ボタンをクリックする
[![Image from Gyazo](https://i.gyazo.com/176a1305478140323dd0112c130e1e89.gif)](https://gyazo.com/176a1305478140323dd0112c130e1e89)

- ### 日記一覧、詳細表示機能
1. トップページで「日記を見る」をクリックする
2. 過去に投稿した日記一覧と、投稿された画像(1枚目)が表示される
3. 見たい日付をクリックすると、日記の詳細が表示される
[![Image from Gyazo](https://i.gyazo.com/c8441a2e7e010a951e66389a1bf10e04.gif)](https://gyazo.com/c8441a2e7e010a951e66389a1bf10e04)
<br />

## 3. 買い物リスト機能
- ### 買い物リスト追加機能
1. トップページで「買い物リスト」をクリックする
2. 追加したい商品をフォームに入力し、「追加する」をクリックする
3. リストの一番上に商品が追加される
[![Image from Gyazo](https://i.gyazo.com/af4c7b5bb51d34072c75a8b8ad9033e8.gif)](https://gyazo.com/af4c7b5bb51d34072c75a8b8ad9033e8)

- ### 買い物リスト削除機能
1. トップページで「買い物リスト」をクリックする
2. 削除したい商品を選択すると、「購入済み」ボタンが表示される
3. 「購入済み」ボタンをクリックすると、リストから商品が消える
[![Image from Gyazo](https://i.gyazo.com/de84f1f9b58c9e72f3213d18fdf4ea7c.gif)](https://gyazo.com/de84f1f9b58c9e72f3213d18fdf4ea7c)
<br />

# 工夫したポイント

## ユーザ視点での利便性を重視した機能実装
- ### 見た目におけるシンプルかつ見やすさの追求
  【事例】
  **買い物リスト機能**における、**javascript**の使用
  - クリックした文字をわかりやすくするため、文字の色を変化させた
  - 画面をシンプルにするために、商品選択時のみ購入済みボタンが表示されるようにした
[![Image from Gyazo](https://i.gyazo.com/a17207fa5e499b2dbde3a2d83c5da771.gif)](https://gyazo.com/a17207fa5e499b2dbde3a2d83c5da771)
<br />

- ### 実際に使用した時に手間だと感じるような要因を洗い出し、解消
  【事例1】
  **画像アップロード機能**における**ダイレクトアップロード機能**の実装<br>
  - バリデーションに引っかかった際に、選択していた画像がリセットされてしまうのを防いだ
[![Image from Gyazo](https://i.gyazo.com/844c54db719b9ba56b50a6e1d5f09cb9.gif)](https://gyazo.com/844c54db719b9ba56b50a6e1d5f09cb9)<br />
  <br />

  【事例2】
  **日記作成・編集ページ**内にも、**ご飯記録作成・更新機能へのリンク**を実装<br>
  - 日記作成・編集時にも、まとめてご飯記録の作成・更新ができるようにした
  - ご飯記録保存後は元の日記ページへ戻れるようにした
  - 日記ページへ戻った際に、入力途中だった画像やフォームデータを入力し直す必要がないようにした
[![Image from Gyazo](https://i.gyazo.com/4f8621f97dd35bf6a3d559f3e17e0023.gif)](https://gyazo.com/4f8621f97dd35bf6a3d559f3e17e0023)
<br />

# 使用技術(開発環境)
- Ruby(2.6.5)
- Ruby on Rails(6.0.3.6)
- MySQL(5.6.50)
- GitHub
- AWS
  - EC2
  - S3
- Visual Studio Code
- Trello
<br />

# 課題や今後実装したい機能
## 課題
・画像投稿機能において、選択済みの画像を選び直すことができない点
・現状の記録項目のみでは、「飼い猫の体調を管理したい」という課題の解決には不十分である点
## 今後実装したい機能
- 日記機能における選択した画像のキャンセル機能
- 毎日の体調を簡単にチェックできるチェックリスト機能
- 病院検索ができる機能
<br />

# DB設計
## ER図
![ER1](https://user-images.githubusercontent.com/74867562/120118323-eedecc80-c1cc-11eb-8af0-88a60ee30876.png)
<br />
<br />

## テーブル設計

### users テーブル

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| email    | string | null: false, unique: true |
| password | string | null: false               |

#### Association

- has_many :diaries
- has_many :feed_managements
- has_many :shopping_lists
<br />

### diaries テーブル

| Column          | Type       | Options                                  |
| --------------- | ---------- | ---------------------------------------- |
| text            | string     |                                          |
| weight          | float      |                                          |
| user            | references | null: false, foreign_key: true           |
| feed_management | references | foreign_key: true                        |
| created_on      | date       | null: false, unique: true(scope:user)    |

#### Association

- belongs_to :user
- belongs_to :feed_management
<br />

### feed_managements テーブル

| Column             | Type        | Options                               |
| ------------------ | ----------- | ------------------------------------- |
| yesterday_leftover | integer     | default: 0, null: false               |
| morning_addition   | integer     | default: 0, null: false               |
| noon_addition      | integer     | default: 0, null: false               |
| evening_addition   | integer     | default: 0, null: false               |
| today_leftover     | integer     | default: 0, null: false               |
| amount_eaten       | integer     | null: false                           |
| created_on         | date        | null: false, unique: true(scope: user)|
| user               | references  | null: false, foreign_key: true        |

#### Association

- has_one :diary
- belongs_to :user
<br />

### shopping_lists テーブル

| Column             | Type        | Options                               |
| ------------------ | ----------- | ------------------------------------- |
| item_name          | string      | null: false                           |
| user               | references  | null: false, foreign_key: true        |

#### Association

- belongs_to :user

