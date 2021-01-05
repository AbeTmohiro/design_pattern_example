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

# -------------- #

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