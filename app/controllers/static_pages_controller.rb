class StaticPagesController < ApplicationController
  def index
    @flickr = Flickr.new(
      Rails.application.credentials.flickr[:access_key_id],
      Rails.application.credentials.flickr[:secret_access_key]
      )
    if params[:search].nil?
      render
    else
      @list = @flickr.photos.search user_id: params[:search]
    end
  end
end
