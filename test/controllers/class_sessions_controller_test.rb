require "test_helper"

class ClassSessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @class_session = class_sessions(:one)
  end

  test "should get index" do
    get class_sessions_url
    assert_response :success
  end

  test "should get new" do
    get new_class_session_url
    assert_response :success
  end

  test "should create class_session" do
    assert_difference("ClassSession.count") do
      post class_sessions_url, params: { class_session: { active: @class_session.active, description: @class_session.description, end_time: @class_session.end_time, instructor_id: @class_session.instructor_id, name: @class_session.name, start_time: @class_session.start_time, training_id: @class_session.training_id } }
    end

    assert_redirected_to class_session_url(ClassSession.last)
  end

  test "should show class_session" do
    get class_session_url(@class_session)
    assert_response :success
  end

  test "should get edit" do
    get edit_class_session_url(@class_session)
    assert_response :success
  end

  test "should update class_session" do
    patch class_session_url(@class_session), params: { class_session: { active: @class_session.active, description: @class_session.description, end_time: @class_session.end_time, instructor_id: @class_session.instructor_id, name: @class_session.name, start_time: @class_session.start_time, training_id: @class_session.training_id } }
    assert_redirected_to class_session_url(@class_session)
  end

  test "should destroy class_session" do
    assert_difference("ClassSession.count", -1) do
      delete class_session_url(@class_session)
    end

    assert_redirected_to class_sessions_url
  end
end
