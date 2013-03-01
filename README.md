# mikutter plugin: Templating-tweet

## About
テンプレートエンジンの mustache を使ってつぶやく mikutter プラグイン


## Configuration
`sample.yaml` の参考に `var_name: value` という形でテンプレートエンジン内で使う変数を `config.yaml` というファイルを作って定義します。


## Usage
`mikutter_plugin_base` と `mustache` という gem を使っているので
```sh
gem i mikutter_plugin_base mustache
```
とするか mikutter の `Gemfile` に
```ruby
gem 'mikutter_plugin_base'
gem 'mustache'
```
と追加して `bundle` したあと起動時に `bundle exec ruby mikutter.rb` としてください。

あとは mikutter のポストボックスで
```mustache
{{ var_name }}your tweet body{{ another_var_name }}
```
など mustache を使ってつぶやくことができます。


## Plan
helper メソッドを追加する仕組み整えます。


## Contribution
バグリポート・要望を歓迎します。プルリクエストも歓迎します。
