require "test_helper"

class Laba10ControllerTest < ActionDispatch::IntegrationTest
  test "should get xml_to_html" do
    get laba10_xml_to_html_url
    assert_response :success
  end
end
