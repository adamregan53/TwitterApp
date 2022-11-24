require "test_helper"

class TweetsControllerTest < ActionDispatch::IntegrationTest
  test "user not logged in redirected to sign in" do
    get '/tweets'
    assert_response :redirect
  end

  test "Logged in user gets index" do
    sign_in users(:one)
    get '/tweets'
    assert_response :success
  end

  test "Will not save without body" do
    sign_in users(:one)
    tweet_body = tweets(:one)
    tweet = Tweet.new(body: tweet_body)
    assert_not tweet.save
  end


end
