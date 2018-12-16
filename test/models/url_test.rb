require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  def setup
    @url = Url.create(
      url: "http://google.com",
      short_url: "localhost:3500/hz/TestShortUrl"
    )
  end

  test "the short_url is unique" do
    duplicate_item = @url.dup
    assert_not duplicate_item.valid?
  end
end
