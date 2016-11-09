require 'test_helper'

class PlayerTest < ActiveSupport::TestCase

  def setup
    @player=Player.new(name:"Rishabh Sinha",rating:5)
    match=Match.new
    @player.match_id=match
  end
  test "should be valid" do
    assert @player.valid?
  end
end
