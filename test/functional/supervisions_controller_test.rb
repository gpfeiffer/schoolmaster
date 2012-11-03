require 'test_helper'

class SupervisionsControllerTest < ActionController::TestCase
  setup do
    @supervision = supervisions(:one)
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:supervisions)
  end

  test "should get new" do
    get :new, :student_id => @student.to_param
    assert_response :success
  end

  test "should create supervision" do
    assert_difference('Supervision.count') do
      post :create, :supervision => { :academic_id => @supervision.academic_id, :student_id => @supervision.student_id, :status => @supervision.status }
    end

    assert_redirected_to @supervision.student
  end

  test "should show supervision" do
    get :show, :id => @supervision
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @supervision
    assert_response :success
  end

  test "should update supervision" do
    put :update, :id => @supervision, :supervision => {  }
    assert_redirected_to @supervision.student
  end

  test "should destroy supervision" do
    assert_difference('Supervision.count', -1) do
      delete :destroy, :id => @supervision
    end

    assert_redirected_to @supervision.student
  end
end
