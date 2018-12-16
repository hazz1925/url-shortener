require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should create url" do
    post urls_create_url, params: { :url => "http://google.com"}, xhr: true
    resp = JSON.parse @response.body

    assert_response :success
    assert_not_empty resp["link"]["short_url"]
    assert_not_empty resp["link"]["url"]
    assert_empty resp["errors"]
  end

  test "should read url from db if exist" do
    url = "http://google.com"
    short_url = "localhost:3500/hz/TestShortUrl"
    Url.create(
      url: url,
      short_url: short_url
    )

    post urls_create_url, params: { :url => url }, xhr: true
    resp = JSON.parse @response.body

    assert_response :success
    assert_equal short_url, resp["link"]["short_url"]
    assert_equal url, resp["link"]["url"]
    assert_empty resp["errors"]
  end

  test "should get show" do
    url = "http://google.com"
    short_url = "http://www.example.com/hz/TestShortUrl"
    Url.create(
      url: url,
      short_url: short_url
    )

    get urls_show_url("TestShortUrl")
    assert_response :redirect
    assert_redirected_to url
  end

end
