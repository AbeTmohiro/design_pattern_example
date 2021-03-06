module AdsHelper

  def ad(ad_type, image_count)
    if ad_type == "gif"
      ad_instance = Gif.new
    elsif ad_type == "image"
      ad_instance = Image.new
    elsif ad_type == "movie"
      ad_instance = Movie.new
    end

    ad_instance.return_html(ad_type, image_count)
  end

  private

  # def ad_types
  #   ad_types = ["gif", "image", "movie"]
  #   ad_types.sample
  # end

  # def image_counts
  #   image_counts = [1, 2]
  #   image_counts.sample
  # end
end

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
  end

  def return_src_1
    # １枚パターン
    @body += '<iframe id="player" type="text/html" width="700px" height="700px" src="/assets/ad_gif1.png" frameborder="0"></iframe>'
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
  end

  def return_body(ad_type, image_count)
    return_src
  end
end

class Movie < AdTemplate
  def return_src
    @body += '<iframe id="player" type="text/html" width="500px" height="500px" src="/assets/ad_movie.png" frameborder="0"></iframe>'
  end

  def return_body(ad_type, image_count)
    return_src
  end
end

# -------------- #

# module PostsHelper
#   attr_reader :ad_type, :image_count

  # def ad
  #   define_attribute
  #   ad = AdTemplate.new
  #   ad.return_html(ad_type, image_count)
  # end

#   private

#   def define_attribute
#     ad_types = ["gif", "image", "movie"]
#     image_counts = [1, 2]
#     @ad_type = ad_types.sample
#     @image_count = image_counts.sample
#   end
# end

# class AdTemplate
#   def return_html(ad_type, image_count)
#     @html = ''
#     @html += '<header>株式会社〇〇</header>'
#     if ad_type == "gif" && image_count == 2
#       @html += '<iframe id="player1" type="text/html" width="700px" height="350px" src="/assets/ad_gif1.png" frameborder="0"></iframe>'
#       @html += '<iframe id="player2" type="text/html" width="700px" height="350px" src="/assets/ad_gif2.png" frameborder="0"></iframe>'

#     elsif ad_type == "gif" && image_count == 1
#       @html += '<iframe id="player" type="text/html" width="700px" height="700px" src="/assets/ad_gif1.png" frameborder="0"></iframe>'

#     elsif ad_type == "image"
#       @html += '<iframe id="player" type="text/html" width="700px" height="700px" src="/assets/ad_image.png" frameborder="0"></iframe>'

#     elsif ad_type == "movie"
#       @html += '<iframe id="player" type="text/html" width="500px" height="500px" src="/assets/ad_movie.png" frameborder="0"></iframe>'

#     end
#     @html += '<footer>詳しくはコチラ</footer>'

#     return @html.html_safe
#   end
# end
