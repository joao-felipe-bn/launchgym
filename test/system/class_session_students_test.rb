require "application_system_test_case"

class ClassSessionStudentsTest < ApplicationSystemTestCase
  setup do
    @class_session_student = class_session_students(:one)
  end

  test "visiting the index" do
    visit class_session_students_url
    assert_selector "h1", text: "Class session students"
  end

  test "should create class session student" do
    visit class_session_students_url
    click_on "New class session student"

    fill_in "Class sessions", with: @class_session_student.class_sessions_id
    fill_in "Students", with: @class_session_student.students_id
    click_on "Create Class session student"

    assert_text "Class session student was successfully created"
    click_on "Back"
  end

  test "should update Class session student" do
    visit class_session_student_url(@class_session_student)
    click_on "Edit this class session student", match: :first

    fill_in "Class sessions", with: @class_session_student.class_sessions_id
    fill_in "Students", with: @class_session_student.students_id
    click_on "Update Class session student"

    assert_text "Class session student was successfully updated"
    click_on "Back"
  end

  test "should destroy Class session student" do
    visit class_session_student_url(@class_session_student)
    click_on "Destroy this class session student", match: :first

    assert_text "Class session student was successfully destroyed"
  end
end
