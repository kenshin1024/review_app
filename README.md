## usersテーブル

|  Column            | Type     | Options                  |
| ------------------ | -------- | ------------------------ |
| email              | string   | null: false, default: "" |
| encrypted_password | string   | null: false, default: "" |
| nickname           | string   | null: false              |

###  Association

- has_many :artists

## artistsテーブル

| Column             | Type       | Options                  |
| ------------------ | ---------- | ------------------------ |
| title              | string     | null:        false       |
| user               | references | foreign_key: true        |

### Association

- belongs_to :user
- has_many   :albums

## albumsテーブル

| Column             | Type        | Options                  |
| ------------------ | ----------- | ------------------------ |
| title              | string      | null:       false        |
| artist             | references  | foreign_key: true        |
| star               | float       |                          |

### Association

- belongs_to :artist
- has_many   :songs

## songsテーブル

| Column             | Type        | Options                  |
| ------------------ | ----------- | ------------------------ |
| title              | string      | null:       false        |
| album              | references  | foreign_key: true        |
| star               | float       | foreign_key: true        |

### Association

- belongs_to :albums

|アプリケーション名  |review-app-35548                                                                |
|アプリケーション概要|アーティストとそのアーティストが出したアルバム、アルバムの中に入っている曲をリストとして整理し  |
|                 |また11段階の星評価(0、 0,5、 1.0、 ...5.0)をつけて