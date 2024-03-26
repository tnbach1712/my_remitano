# frozen_string_literal: true
require "application_system_test_case"

class ShareVideosTest < ApplicationSystemTestCase
  setup do
    @share_video = share_videos(:one)
  end

  test "visiting the index" do
    visit share_videos_url
    assert_selector "h1", text: "Share videos"
  end

  test "should create share video" do
    visit share_videos_url
    click_on "New share video"

    fill_in "Description", with: @share_video.description
    fill_in "Title", with: @share_video.title
    fill_in "Url", with: @share_video.url
    fill_in "User", with: @share_video.user_id
    click_on "Create Share video"

    assert_text "Share video was successfully created"
    click_on "Back"
  end

  test "should update Share video" do
    visit share_video_url(@share_video)
    click_on "Edit this share video", match: :first

    fill_in "Description", with: @share_video.description
    fill_in "Title", with: @share_video.title
    fill_in "Url", with: @share_video.url
    fill_in "User", with: @share_video.user_id
    click_on "Update Share video"

    assert_text "Share video was successfully updated"
    click_on "Back"
  end

  test "should destroy Share video" do
    visit share_video_url(@share_video)
    click_on "Destroy this share video", match: :first

    assert_text "Share video was successfully destroyed"
  end
end
