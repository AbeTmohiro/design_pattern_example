# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* 仕様

## 初期操作
ターミナルで以下を実施

```bash
bundle install
rails db:create
rails db:migrate
rails s
```

## コード一覧
### コントローラ

```ruby
class AdsController < ApplicationController
  def index
    choose_ad_types
    choose_image_counts
  end

  private
  def choose_ad_types
    ad_types = ["gif", "image", "movie"]
    # sampleメソッドを使って配列の中身をランダムに取得
    @ad_type = ad_types.sample
  end

  def choose_image_counts
    image_counts = [1, 2]
    # sampleメソッドを使って配列の中身をランダムに取得
    @image_count = image_counts.sample
  end
end
```

### ヘルパーメソッド
```ruby
module AdsHelper
  def ad(ad_type, image_count)
    if ad_type == "gif"
      gif = Gif.new
      gif.return_html(ad_type, image_count)
    elsif ad_type == "image"
      image = Image.new
      image.return_html(ad_type, image_count)
    elsif ad_type == "movie"
      movie = Movie.new
      movie.return_html(ad_type, image_count)
    end
  end
end
```

### TemplateMethodパターンを使った場合のコード

```ruby
class AdTemplate
  def initialize
    @header = '<header>株式会社〇〇</header>'
    @footer = '<footer>詳しくはコチラ</footer>'
    @body = ''
  end

  def return_body
    raise "Call Abstract Method :return_body"
  end

  def return_html(ad_type, image_count)
    return_body(ad_type, image_count)
    @html = ''
    @html = @header + @body + @footer
    @html.html_safe
  end
end
class Gif < AdTemplate
  def return_src_2
    # ２枚パターン
    @body += '<iframe id="player1" type="text/html" width="700px" height="350px" src="/assets/ad_gif1.png" frameborder="0"></iframe>'
    @body += '<iframe id="player2" type="text/html" width="700px" height="350px" src="/assets/ad_gif2.png" frameborder="0"></iframe>'
    return @body
  end
  def return_src_1
    # １枚パターン
    @body += '<iframe id="player" type="text/html" width="700px" height="700px" src="/assets/ad_gif1.png" frameborder="0"></iframe>'
    return @body
  end
  def return_body(ad_type, image_count)
    if image_count == 2
      return_src_2
    else
      return_src_1
    end
  end
end
class Image < AdTemplate
  def return_src
    @body += '<iframe id="player" type="text/html" width="700px" height="700px" src="/assets/ad_image.png" frameborder="0"></iframe>'
    return @body
  end
  def return_body(ad_type, image_count)
    return_src
  end
end

class Movie < AdTemplate
  def return_src
    @body += '<iframe id="player" type="text/html" width="500px" height="500px" src="/assets/ad_movie.png" frameborder="0"></iframe>'
    return @body
  end
  def return_body(ad_type, image_count)
    return_src
  end
end
```

### アンチパターン:条件分岐のみのコード

```ruby
class AdTemplate
    @header = '<header>株式会社〇〇</header>'
    @footer = '<footer>詳しくはコチラ</footer>'
  def return_html(ad_type, image_count)
    @html = ''
    @html += '<header>株式会社〇〇</header>'
    if ad_type == "gif" && image_count == 2
      @html += '<iframe id="player1" type="text/html" width="700px" height="350px" src="/assets/ad_gif1.png" frameborder="0"></iframe>'
      @html += '<iframe id="player2" type="text/html" width="700px" height="350px" src="/assets/ad_gif2.png" frameborder="0"></iframe>'

    elsif ad_type == "gif" && image_count == 1
      @html += '<iframe id="player" type="text/html" width="700px" height="700px" src="/assets/ad_gif1.png" frameborder="0"></iframe>'

    elsif ad_type == "image"
      @html += '<iframe id="player" type="text/html" width="700px" height="700px" src="/assets/ad_image.png" frameborder="0"></iframe>'

    elsif ad_type == "movie"
      @html += '<iframe id="player" type="text/html" width="500px" height="500px" src="/assets/ad_movie.png" frameborder="0"></iframe>'

    end
    @html += '<footer>詳しくはコチラ</footer>'

    return @html.html_safe
  end
end
```

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions


