require "rails_helper"

RSpec.describe "the bachelorette show" do
  it "shows the bachelorette and all it's attributes" do
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

    visit "/bachelorettes/#{bach.id}/show"

    expect(page).to have_content(bach.name)
    expect(page).to have_content(bach.season_number)
    expect(page).to have_content(bach.season_description)
    
    click_link("All contestants for #{bach.name}")

    expect(page).to have_content(contest1.name)
    expect(page).to have_content(contest1.age)
    expect(page).to have_content(contest1.hometown)
    expect(page).to have_content(contest2.name)
    expect(page).to have_content(contest2.age)
    expect(page).to have_content(contest2.hometown)
    expect(page).to have_content(contest3.name)
    expect(page).to have_content(contest3.age)
    expect(page).to have_content(contest3.hometown)

    # save_and_open_page

    click_link("#{contest1.name}")

    expect(page).to have_content(contest1.name)
    expect(page).to have_content(bach.season_number)
    expect(page).to have_content(bach.season_description)
    expect(page).to have_content(outing1.name)
    expect(page).to have_content(outing1.location)
    expect(page).to have_content(outing1.date)
    expect(page).to have_content(outing2.name)
    expect(page).to have_content(outing2.location)
    expect(page).to have_content(outing2.date)
    expect(page).to have_content(outing3.name)
    expect(page).to have_content(outing3.location)
    expect(page).to have_content(outing3.date)

    click_link("#{outing1.name}")

    expect(page).to have_content(outing1.name)
    expect(page).to have_content(outing1.location)
    expect(page).to have_content(outing1.date)

    expect(page).to have_content(contest1.name)
    expect(page).to have_content(contest1.age)
    expect(page).to have_content(contest1.hometown)
    expect(page).to have_content(contest2.name)
    expect(page).to have_content(contest2.age)
    expect(page).to have_content(contest2.hometown)
    expect(page).to have_content(2)
  end

  it "Average age of contestants" do
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

    visit "/bachelorettes/#{bach.id}/show"

    expect(page).to have_content("The average age of contestants: 22")
  end
end
