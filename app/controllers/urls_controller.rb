class UrlsController < ApplicationController
  def create
    @url = params[:url]
    @url_model = Url.find_by(url: @url)
    if @url_model.nil?
      @url_model = Url.create(
        url: @url,
        short_url: SecureRandom.urlsafe_base64(10, false)
      )
    end
    @response = {
      :link => {
        :url => @url_model.url,
        :short_url => @url_model.short_url
      },
      :errors => []
    }
    render :json => @response
  end

  def new
  end

  def show
  end
end
