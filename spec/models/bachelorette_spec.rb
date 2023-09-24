require "rails_helper"

RSpec.describe Bachelorette, type: :model do
  describe "relationships" do
    it {should have_many :contestants}
  end

  it "#average_contestant_age" do
    bach = Bachelorette.create!(name: "Martha", season_number: 10, season_description: "Again!?")
    contest1 = bach.contestants.create!(name: "Bob", age: 21, hometown: "nowhere")
    contest2 = bach.contestants.create!(name: "Mike", age: 22, hometown: "nowhere")
    contest3 = bach.contestants.create!(name: "Tim", age: 23, hometown: "nowhere")

    outing1 = Outing.create!(name: "Firefest", location: "Canada", date: "10/11/2023")
    outing2 = Outing.create!(name: "Foozball", location: "Mexico", date: "3/11/2023")
    outing3 = Outing.create!(name: "Horseshoes", location: "Texas", date: "06/11/2023")

    contestant_outing1 = ContestantOuting.create!(contestant:contest1, outing:outing1)
    contestant_outing2 = ContestantOuting.create!(contestant:contest1, outing:outing2)
    contestant_outing3 = ContestantOuting.create!(contestant:contest1, outing:outing3)
    contestant_outing4 = ContestantOuting.create!(contestant:contest2, outing:outing1)
    contestant_outing5 = ContestantOuting.create!(contestant:contest2, outing:outing2)
    contestant_outing6 = ContestantOuting.create!(contestant:contest3, outing:outing3)

    expect(bach.average_contestant_age).to eq(22)
  end

  it "#unique_towns" do
  bach = Bachelorette.create!(name: "Martha", season_number: 10, season_description: "Again!?")
  contest1 = bach.contestants.create!(name: "Bob", age: 21, hometown: "nowhere")
  contest2 = bach.contestants.create!(name: "Mike", age: 22, hometown: "nowhere")
  contest3 = bach.contestants.create!(name: "Tim", age: 23, hometown: "city")

  outing1 = Outing.create!(name: "Firefest", location: "Canada", date: "10/11/2023")
  outing2 = Outing.create!(name: "Foozball", location: "Mexico", date: "3/11/2023")
  outing3 = Outing.create!(name: "Horseshoes", location: "Texas", date: "06/11/2023")

  contestant_outing1 = ContestantOuting.create!(contestant:contest1, outing:outing1)
  contestant_outing2 = ContestantOuting.create!(contestant:contest1, outing:outing2)
  contestant_outing3 = ContestantOuting.create!(contestant:contest1, outing:outing3)
  contestant_outing4 = ContestantOuting.create!(contestant:contest2, outing:outing1)
  contestant_outing5 = ContestantOuting.create!(contestant:contest2, outing:outing2)
  contestant_outing6 = ContestantOuting.create!(contestant:contest3, outing:outing3)

  expect(bach.unique_towns).to eq("city, nowhere")
  end 
end
