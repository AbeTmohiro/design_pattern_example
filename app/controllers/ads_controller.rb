class AdsController < ApplicationController
  def index
    ad_types = ["gif","image","movie"]
    @ad_type = ad_types.sample
    image_counts = [1,2]
    @image_count = image_counts.sample
  end
end
