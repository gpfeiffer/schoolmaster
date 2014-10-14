require 'test_helper'

class LoadsControllerTest < ActionController::TestCase
  setup do
    @load = loads(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create load" do
    assert_difference('Load.count') do
      post :create, load: { academic_id: @load.academic_id, atom_id: @load.atom_id, date: @load.date, times: @load.times, weeks: @load.weeks, hours: @load.hours, semester: @load.semester, comment: @load.comment }
    end

    assert_redirected_to load_path(assigns(:load))
  end

  test "should show load" do
    get :show, id: @load
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @load
    assert_response :success
  end

  test "should update load" do
    put :update, id: @load, load: { academic_id: @load.academic_id, atom_id: @load.atom_id, date: @load.date, times: @load.times, weeks: @load.weeks, hours: @load.hours, semester: @load.semester, comment: @load.comment }
    assert_redirected_to load_path(assigns(:load))
  end

  test "should destroy load" do
    assert_difference('Load.count', -1) do
      delete :destroy, id: @load
    end

    assert_redirected_to atom_path(assigns(:load).atom)
  end
end
