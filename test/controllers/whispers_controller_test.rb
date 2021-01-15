require 'test_helper'

class WhispersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get whispers_index_url
    assert_response :success
  end

end
