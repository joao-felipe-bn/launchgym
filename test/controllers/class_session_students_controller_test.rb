require "test_helper"

class ClassSessionStudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_session_student = class_session_students(:one)
  end

  test "should get index" do
    get class_session_students_url
    assert_response :success
  end

  test "should get new" do
    get new_class_session_student_url
    assert_response :success
  end

  test "should create class_session_student" do
    assert_difference("ClassSessionStudent.count") do
      post class_session_students_url, params: { class_session_student: { class_session_id: @class_session_student.class_session_id, student_id: @class_session_student.student_id } }
    end

    assert_redirected_to class_session_student_url(ClassSessionStudent.last)
  end

  test "should show class_session_student" do
    get class_session_student_url(@class_session_student)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_session_student_url(@class_session_student)
    assert_response :success
  end

  test "should update class_session_student" do
    patch class_session_student_url(@class_session_student), params: { class_session_student: { class_session_id: @class_session_student.class_session_id, student_id: @class_session_student.student_id } }
    assert_redirected_to class_session_student_url(@class_session_student)
  end

  test "should destroy class_session_student" do
    assert_difference("ClassSessionStudent.count", -1) do
      delete class_session_student_url(@class_session_student)
    end

    assert_redirected_to class_session_students_url
  end
end
