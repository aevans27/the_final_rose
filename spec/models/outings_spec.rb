require "rails_helper"

RSpec.describe Outing, type: :model do
  describe "relationships" do
    it { should have_many :contestant_outings }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  it "#get_contestants_count" do
    bach = Bachelorette.create!(name: "Martha", season_number: 10, season_description: "Again!?")
    contest1 = bach.contestants.create!(name: "Bob", age: 21, hometown: "nowhere")
    contest2 = bach.contestants.create!(name: "Mike", age: 22, hometown: "nowhere")
    contest3 = bach.contestants.create!(name: "Tim", age: 23, hometown: "nowhere")

    outing1 = Outing.create!(name: "Firefest", location: "Canada", date: "10/11/2023")

    contestant_outing1 = ContestantOuting.create!(contestant:contest1, outing:outing1)
    contestant_outing2 = ContestantOuting.create!(contestant:contest2, outing:outing1)
    contestant_outing3 = ContestantOuting.create!(contestant:contest3, outing:outing1)

    expect(outing1.get_contestant_count).to eq(3)
  end
end