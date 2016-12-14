require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
   setup do
    sign_in User.create(:email => "#{rand(50000)}@example.com",:password=>"password1234")
    @tournament = tournaments(:one)
    end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "h1","Sanskriti Livingston Chess Club"
  end

end
