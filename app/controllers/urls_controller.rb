class UrlsController < ApplicationController
  def create
    url = formatUrl(params[:url])
    puts url
    url_model = Url.where(url: url)
      .first_or_create(short_url: "#{request.base_url}/hz/#{SecureRandom.urlsafe_base64(10, false)}")

    response = {
      :link => {
        :url => url_model.url,
        :short_url => url_model.short_url
      },
      :errors => []
    }
    render :json => response
  end

  def new
  end

  def show
    short_url =  "#{request.base_url}/hz/#{params[:short_url]}"
    url_model = Url.find_by(short_url: short_url)

    redirect_to url_model.url
  end

  def formatUrl(url)
    if !url.index("http://")
      return "http://#{url}"
    end
  end
end
