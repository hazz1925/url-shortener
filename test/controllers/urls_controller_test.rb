require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get urls_show_url
    assert_response :success
  end

end
