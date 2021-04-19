require "test_helper"

class SubscribersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subscriber = subscribers(:one)
  end

  test "should get new" do
    get new_subscriber_url
    assert_response :success
  end

  test "should create subscriber" do
    assert_difference('Subscriber.count') do
      post subscribers_url, params: { subscriber: { email: "test@test.ie", name: @subscriber.name } }
    end

    assert_redirected_to thank_you_subscribers_path
  end

  test "should get thank_you" do
    get thank_you_subscribers_path
    assert_response :success
  end
end
