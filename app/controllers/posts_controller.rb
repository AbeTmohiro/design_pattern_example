class PostsController < ApplicationController
  def index
    ad_types
    image_counts
  end

  private

  def ad_types
    ad_types = ["gif", "image", "movie"]
    @ad_type = ad_types.sample
  end

  def image_counts
    image_counts = [1, 2]
    @image_count = image_counts.sample
  end
end
