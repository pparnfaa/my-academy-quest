require 'rails_helper'

RSpec.describe "Quests", type: :system do
  fixtures :quests

  setup do
    @quest_one = quests(:one)
    @quest_two = quests(:two)
  end

  it "should display title and profile completely" do
    visit quests_path

    expect(page).to have_css("[data-testid='page-root']")
    expect(page).to have_css("[data-testid='page-title']", text: "My Academy Quest")
    expect(page).to have_css("[data-testid='profile-image']")
    expect(page).to have_css("[data-testid='brag-button']")
    expect(page).to have_css("[data-testid='quest-input']")
    expect(page).to have_css("[data-testid='add-quest']")
  end

  it "should create a new quest and display it in the list" do
    visit quests_path

    find("[data-testid='quest-input']").fill_in(with: "Learn RSpec System Test")
    find("[data-testid='add-quest']").click

    expect(page).to have_text("Learn RSpec System Test")
  end

  it "should toggle status and change style to strikethrough", js: true do
    visit quests_path

    expect(page).to have_css("[data-testid='quest-item-#{@quest_one.id}'].text-gray-800")

    find("[data-testid='quest-toggle-#{@quest_one.id}']").click

    expect(page).to have_css("[data-testid='quest-item-#{@quest_one.id}'].line-through.text-gray-400")
  end


  it "should delete quest after confirmation and remove it from the list", js: true do
    visit quests_path

    expect(page).to have_css("[data-testid='quest-item-#{@quest_one.id}']")
    expect(page).to have_css("[data-testid='quest-item-#{@quest_two.id}']")

    accept_confirm "Are you sure?" do
      find("[data-testid='quest-delete-button-#{@quest_one.id}']").click
    end

    expect(page).to have_no_css("[data-testid='quest-item-#{@quest_one.id}']")
    expect(page).to have_css("[data-testid='quest-item-#{@quest_two.id}']")
  end


  it "should navigate to brag document page when brag button is clicked" do
    visit quests_path
    find("[data-testid='brag-button']").click
    expect(page).to have_current_path(brag_path)
  end
end
