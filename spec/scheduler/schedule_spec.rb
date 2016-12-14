require 'rails_helper'
require 'schedule/schedulemodel'
RSpec.describe TournamentModel do
  it "Two player tournament would have one match" do
     players=[]
     players << PlayerModel.new("player1",3)

     players << PlayerModel.new("player2",3)
     t=TournamentModel.new(players,1)
     puts "#{t.splitandschedule}"
     expect(t.splitandschedule.length).to eq(1)
  end
end