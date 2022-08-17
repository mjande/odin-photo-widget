require 'flickr'

class StaticPagesController < ApplicationController
  def index
    return unless params[:user_id]

    flickr = Flickr.new
    @user = flickr.people.getInfo user_id: params[:user_id]
    @photos = flickr.people.getPublicPhotos user_id: params[:user_id]
    @photo_urls = @photos.map { |photo| Flickr.url_m(photo) }
  end
end
