require 'flickr'

class StaticPagesController < ApplicationController
  def index
    return unless params[:username]

    flickr = Flickr.new
    user_id = flickr.people.findByUsername(username: params[:username]).id
    @user = flickr.people.getInfo(user_id:)
    @photos = flickr.people.getPublicPhotos(user_id:)
    @photo_urls = @photos.map { |photo| Flickr.url_m(photo) }
  end
end
