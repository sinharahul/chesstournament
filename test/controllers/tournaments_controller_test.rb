require 'test_helper'

class TournamentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in User.create(:email => "#{rand(50000)}@example.com",:password=>"password1234")
    @tournament = tournaments(:one)
    end

  test "should get index" do
     get tournaments_url
    assert_response :success
  end

  test "should get new" do
    get new_tournament_url
    assert_response :success
  end

  test "should create one round for 2 players" do
    assert_difference('Tournament.count') do
      post tournaments_url, params: { tournament: { name: @tournament.name, rounds: @tournament.rounds },

                                     players: {"1":{name:"player1",rating:"1"},"2":{name:"player2",rating:"1"}    }
                                    }
    end

    assert_redirected_to tournament_url(Tournament.last)
    p tournament_url(Tournament.last)
    #Magic sauce ,do a get and then read elements of page
    get tournament_url(Tournament.last)
    assert_select "title","Livingston Chess Club"
    assert_select "table",:count => 2
    assert_select "#matchTable tbody tr",:count => 1
  end

  test "should show tournament" do
    get tournament_url(@tournament)
    assert_response :success
  end

  test "should get edit" do
    get edit_tournament_url(@tournament)
    assert_response :success
  end

  test "should update tournament" do
    patch tournament_url(@tournament), params: { tournament: { name: @tournament.name, rounds: @tournament.rounds } ,
                                                 matches: {"1": {name:"m1",result:"1"},"2": {name:"m1",result:"1"}}
                                             }
    assert_redirected_to tournament_url(@tournament)
  end

  test "should destroy tournament" do
    assert_difference('Tournament.count', -1) do
      delete tournament_url(@tournament)
    end

    assert_redirected_to tournaments_url
  end
end
