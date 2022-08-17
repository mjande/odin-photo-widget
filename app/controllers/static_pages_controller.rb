require 'flickr'

class StaticPagesController < ApplicationController
  def new
    flickr = Flickr.new
    @photos = flickr.people.getPublicPhotos user_id: '196361530@N08'
    @photo_urls = @photos.map do |photo|
      "https://live.staticflickr.com/#{photo.server}/#{photo.id}_#{photo.secret}.jpg"
    end
  end
end
