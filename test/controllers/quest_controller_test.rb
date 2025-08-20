require "test_helper"

class QuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quest = quests(:one)
  end

  test "should get index" do
    get quests_path
    assert_response :success
    assert_select "form[action=?]", quests_path
  end

  test "should create quest" do
    assert_difference("Quest.count") do
      post quests_path, params: { quest: { title: "New Quest", status: false } }
    end
    assert_redirected_to quests_path
  end

  test "should update status quest" do
    patch quest_path(@quest), params: { quest: { status: true } }
    assert_redirected_to quests_path
    @quest.reload
    assert_equal true, @quest.status
  end

  test "should destroy quest" do
    assert_difference("Quest.count", -1) do
      delete quest_path(@quest)
    end
    assert_redirected_to quests_path
  end
end
