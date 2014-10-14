require 'test_helper'

class DirectionsControllerTest < ActionController::TestCase
  setup do
    @direction = directions(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:directions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create direction" do
    assert_difference('Direction.count') do
      post :create, direction: { academic_id: @direction.academic_id, comment: @direction.comment, midterm_mark: @direction.midterm_mark, presentation_mark: @direction.presentation_mark, project_id: @direction.project_id, report_mark: @direction.report_mark }
    end

    assert_redirected_to direction_path(assigns(:direction))
  end

  test "should show direction" do
    get :show, id: @direction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @direction
    assert_response :success
  end

  test "should update direction" do
    put :update, id: @direction, direction: { academic_id: @direction.academic_id, comment: @direction.comment, midterm_mark: @direction.midterm_mark, presentation_mark: @direction.presentation_mark, project_id: @direction.project_id, report_mark: @direction.report_mark }
    assert_redirected_to direction_path(assigns(:direction))
  end

  test "should destroy direction" do
    assert_difference('Direction.count', -1) do
      delete :destroy, id: @direction
    end

    assert_redirected_to directions_path
  end
end
