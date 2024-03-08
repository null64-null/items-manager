# 家の物・買い物同時管理モバイルアプリ「ざいこくん」
<br>

## 概要
家の物の在庫の個数の管理と、買う場所の管理が同時にできるモバイルアプリの制作

## 開発の目的
- 日用品を切らして困る
- どこにしまったかを忘れる
- 買い物に行く時何をどこで買ったらいいかメモするのが大変

など、家の物や買い物の管理を簡単にするモバイルアプリを作る
（最終的に、家族で使えるようにオンラインアプリにする）
<br><br>

## 使用技術
flutter, dart, sqlite
<br><br>

## 使い方・機能一覧
### 登録できる物
- アイテム（id、名称、収納する場所（id）、買い物をする場所（id）、残りの個数、最大何個ストックするか？）
- 収納する場所（id、名称）
- 買い物を行う店（id、名称）

### ページ一覧
- ホーム
- ストックするもの一覧（収納場所一覧）
- 買い物リスト（買うお店の一覧）
- アイテム編集ページ

### 収納場所と買う場所の追加・編集・削除
- ダイアログから編集可能
- 並び替えも可能（アイテムのテーブルに順序を管理するカラムを設けて管理）

### アイテムの追加・編集・削除
- 編集ページから編集可能
- 並び替えも前項同様に可能
<br><br><br>


## 今後やりたいことなど
* 目的にもある通り、家族で使えるようにオンライン化したいです
* 最終的に以下のような機能を備え、住人が何もしなくても物が管理できるようにしたいです
  * 買ってきた物の写真、冷蔵庫に設置したカメラなどで、画像的に何がいくつあるかを全自動管理（AI、IoT）
  * 何かが足りなくなったら、切らしてしまう前に何をどこに買いに行くかをリマインドする
  * 冷蔵庫の残りから献立を組んでくれる（AI）
  * ティッシュなどの物の使いすぎを警告する
<br><br>

## ライセンス
本リポジトリのライセンスは、 MIT ライセンスの規約に基づいて付与されています
（LICENCE に記載）
