require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
setup do
       sign_in User.create(:email => "#{rand(50000)}@example.com",:password=>"password1234")
     end


  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

end
