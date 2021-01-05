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
