require 'test_helper'

class AcademicsControllerTest < ActionController::TestCase
  setup do
    @academic = academics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:academics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create academic" do
    assert_difference('Academic.count') do
      post :create, :academic => { :first => @academic.first, :home_url => @academic.home_url, :image_url => @academic.image_url, :last => @academic.last, :title => @academic.title, :work_mail => @academic.work_mail, :work_phone => @academic.work_phone, :school => @academic.school }
    end

    assert_redirected_to academic_path(assigns(:academic))
  end

  test "should show academic" do
    get :show, :id => @academic
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @academic
    assert_response :success
  end

  test "should update academic" do
    put :update, :id => @academic, :academic => { :first => @academic.first, :home_url => @academic.home_url, :image_url => @academic.image_url, :last => @academic.last, :title => @academic.title, :work_mail => @academic.work_mail, :work_phone => @academic.work_phone }
    assert_redirected_to academic_path(assigns(:academic))
  end

  test "should destroy academic" do
    assert_difference('Academic.count', -1) do
      delete :destroy, :id => @academic
    end

    assert_redirected_to academics_path
  end
end
