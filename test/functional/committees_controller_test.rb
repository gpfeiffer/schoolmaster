require 'test_helper'

class CommitteesControllerTest < ActionController::TestCase
  setup do
    @committee = committees(:one)
    @student = students(:two)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:committees)
  end

  test "should get new" do
    get :new, student_id: @student
    assert_response :success
  end

  test "should create committee" do
    assert_difference('Committee.count') do
      post :create, committee: { academic_id: @committee.academic_id, student_id: @student, chair: false }
    end

    assert_redirected_to student_path(assigns(:committee).student)
  end

  test "should show committee" do
    get :show, :id => @committee
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @committee
    assert_response :success
  end

  test "should update committee" do
    put :update, :id => @committee, committee: { academic_id: @committee.academic_id, student_id: @committee.student_id, chair: false }
    assert_redirected_to @committee.student
  end

  test "should destroy committee" do
    assert_difference('Committee.count', -1) do
      delete :destroy, :id => @committee
    end

    assert_redirected_to @committee.student
  end
end
