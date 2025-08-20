require "test_helper"

class QuestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @quest = quests(:one)
  end

  test "should get index" do
    get quests_url
    assert_response :success
    assert_select "form[action=?]", quests_path
  end

  test "should create quest" do
    assert_difference("Quest.count") do
      post quests_url, params: { quest: { title: "Quest ใหม่", status: false } }
    end
    assert_redirected_to quests_path
  end

  test "should update quest" do
    patch quest_url(@quest), params: { quest: { title: "แก้ไขชื่อแล้ว", status: true } }
    assert_redirected_to quests_path
    @quest.reload
    assert_equal "แก้ไขชื่อแล้ว", @quest.title
    assert_equal true, @quest.status
  end

  test "should destroy quest" do
    assert_difference("Quest.count", -1) do
      delete quest_url(@quest)
    end
    assert_redirected_to quests_path
  end
end
