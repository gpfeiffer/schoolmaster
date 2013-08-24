require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  setup do
    @course = courses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:courses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create course" do
    assert_difference('Course.count') do
      post :create, course: { code: @course.code, content: @course.content, credits: @course.credits, description: @course.description, examined: @course.examined, lab_hours: @course.lab_hours, lecture_hours: @course.lecture_hours, placement_hours: @course.placement_hours, self_study_hours: @course.self_study_hours, taught: @course.taught, title: @course.title, tutorial_hours: @course.tutorial_hours }
    end

    assert_redirected_to course_path(assigns(:course))
  end

  test "should show course" do
    get :show, id: @course
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @course
    assert_response :success
  end

  test "should update course" do
    put :update, id: @course, course: { code: @course.code, content: @course.content, credits: @course.credits, description: @course.description, examined: @course.examined, lab_hours: @course.lab_hours, lecture_hours: @course.lecture_hours, placement_hours: @course.placement_hours, self_study_hours: @course.self_study_hours, taught: @course.taught, title: @course.title, tutorial_hours: @course.tutorial_hours }
    assert_redirected_to course_path(assigns(:course))
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete :destroy, id: @course
    end

    assert_redirected_to courses_path
  end
end
