require 'test_helper'

class RecordsControllerTest < ActionController::TestCase
  setup do
    @record = records(:one)
    @academic = academics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:records)
  end

  test "should get new" do
    get :new, :academic_id => @academic.to_param
    assert_response :success
  end

  test "should create record" do
    assert_difference('Record.count') do
      post :create, record: { academic_id: @record.academic_id, authorid: @record.authorid, broker_id: @record.broker_id }
    end

    assert_redirected_to academic_path(assigns(:record).academic)
  end

  test "should show record" do
    get :show, id: @record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @record
    assert_response :success
  end

  test "should update record" do
    put :update, id: @record, record: { academic_id: @record.academic_id, authorid: @record.authorid, broker_id: @record.broker_id }
    assert_redirected_to academic_path(assigns(:record).academic)
  end

  test "should destroy record" do
    assert_difference('Record.count', -1) do
      delete :destroy, id: @record
    end

    assert_redirected_to records_path
  end
end
