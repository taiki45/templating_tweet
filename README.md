# mikutter plugin: Templating-tweet

## About
テンプレートエンジンを使ってつぶやく mikutter プラグイン


## Configuration
`sample.yaml` の参考に `var_name: value` という形でテンプレートエンジン内で使う変数を `config.yaml` というファイルを作って定義します。


## Usage
`mikutter_plugin_base` という gem を使っているので
```sh
gem i mikutter_plugin_base
```
とするか mikutter の `Gemfile` に
```ruby
gem 'mikutter_plugin_base'
```
と追加して起動時に `bundle exec ruby mikutter.rb` としてください。

あとは mikutter のポストボックスで
```mustache
{{ var_name }}your tweet body{{ another_var_name }}
```
などテンプレートエンジンを使ってつぶやくことができます。


## Plan
eRuby だとめんどくさいので他のテンプレートエンジンに対応するつもりです。
あと、今だと `Env` クラスを直接編集しないとテンプレートエンジンの評価内で使えるメソッド追加できないのでその追加方法もつけます。


## Contribution
バグリポート・要望を歓迎します。プルリクエストも歓迎します。
