# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|email|string|null: false, unique: true|
|password|string|null: false|
|timestamps|datetime|null: false|

### Association
- has many :messages
- has many :groups, through: :group-users

## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|body|text|
|image|text|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has many :messages
- has many :users, through: :group-users
- accepts_nested_attributes_for :group_users

## group-usersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|group_id|reference|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
