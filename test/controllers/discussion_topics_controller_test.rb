require "test_helper"

class DiscussionTopicsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get discussion_topics_index_url
    assert_response :success
  end
end
