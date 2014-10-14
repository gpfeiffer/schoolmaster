require 'test_helper'

class InstancesControllerTest < ActionController::TestCase
  setup do
    @instance = instances(:one)
    @molecule = molecules(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:instances)
  end

  test "should get new" do
    get :new, molecule_id: @molecule
    assert_response :success
  end

  test "should create instance" do
    assert_difference('Instance.count') do
      post :create, instance: { molecule_id: @instance.molecule_id, credits: @instance.credits, status: @instance.status, date: @instance.date, cohort_id: @instance.cohort_id }
    end

    assert_redirected_to molecule_path(assigns(:instance).molecule)
  end

  test "should show instance" do
    get :show, id: @instance
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @instance
    assert_response :success
  end

  test "should update instance" do
    put :update, id: @instance, instance: { molecule_id: @instance.molecule_id, credits: @instance.credits, status: @instance.status, date: @instance.date, cohort_id: @instance.cohort_id }
    assert_redirected_to molecule_path(assigns(:instance).molecule)
  end

  test "should destroy instance" do
    assert_difference('Instance.count', -1) do
      delete :destroy, id: @instance
    end

    assert_redirected_to molecule_path(assigns(:instance).molecule)
  end
end
