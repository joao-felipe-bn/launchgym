require "application_system_test_case"

class ClassSessionsTest < ApplicationSystemTestCase
  setup do
    @class_session = class_sessions(:one)
  end

  test "visiting the index" do
    visit class_sessions_url
    assert_selector "h1", text: "Class sessions"
  end

  test "should create class session" do
    visit class_sessions_url
    click_on "New class session"

    check "Active" if @class_session.active
    fill_in "Description", with: @class_session.description
    fill_in "End time", with: @class_session.end_time
    fill_in "Instructor", with: @class_session.instructor_id
    fill_in "Name", with: @class_session.name
    fill_in "Start time", with: @class_session.start_time
    fill_in "Training", with: @class_session.training_id
    click_on "Create Class session"

    assert_text "Class session was successfully created"
    click_on "Back"
  end

  test "should update Class session" do
    visit class_session_url(@class_session)
    click_on "Edit this class session", match: :first

    check "Active" if @class_session.active
    fill_in "Description", with: @class_session.description
    fill_in "End time", with: @class_session.end_time
    fill_in "Instructor", with: @class_session.instructor_id
    fill_in "Name", with: @class_session.name
    fill_in "Start time", with: @class_session.start_time
    fill_in "Training", with: @class_session.training_id
    click_on "Update Class session"

    assert_text "Class session was successfully updated"
    click_on "Back"
  end

  test "should destroy Class session" do
    visit class_session_url(@class_session)
    click_on "Destroy this class session", match: :first

    assert_text "Class session was successfully destroyed"
  end
end
