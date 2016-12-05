require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
   test "home" do
      sign_in User.create(:email => "#{rand(50000)}@example.com",:password=>"password1234")
      get root_url
      assert_response :success
    end
end
