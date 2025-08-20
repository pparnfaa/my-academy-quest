require "rails_helper"

RSpec.describe "Quests", type: :request do
  describe "GET /quests" do
    it "should load index successfully" do
      get quests_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("My Academy Quest")
    end
  end

  describe "POST /quests" do
    it "should create quest successfully" do
      expect {
        post quests_path, params: { quest: { title: "Ruby On Rails", status: false } }
      }.to change(Quest, :count).by(1)

      expect(response).to redirect_to(quests_path)
    end
  end

  describe "PATCH /quests/:id" do
    let!(:quest) { Quest.create!(title: "Can i edit", status: false) }

    it "should update quest successfully" do
      patch quest_path(quest), params: { quest: { status: true } }
      expect(response).to redirect_to(quests_path)

      quest.reload
      expect(quest.status).to eq(true)
    end
  end

  describe "DELETE /quests/:id" do
    let!(:quest) { Quest.create!(title: "Ruby on Rails", status: false) }

    it "should delete quest successfully" do
      expect {
        delete quest_path(quest)
      }.to change(Quest, :count).by(-1)

      expect(response).to redirect_to(quests_path)
    end
  end
end

RSpec.describe "Brag Document", type: :request do
  describe "GET /brag" do
    it "should load brag index successfully" do
      get brag_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include("My Brag Document")
    end
  end
end
