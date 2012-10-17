require 'test_helper'

class PublicationRecordsControllerTest < ActionController::TestCase
  setup do
    @publication_record = publication_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:publication_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create publication_record" do
    assert_difference('PublicationRecord.count') do
      post :create, :publication_record => { :academic_id => @publication_record.academic_id, :authorid => @publication_record.authorid, :resource => @publication_record.resource }
    end

    assert_redirected_to publication_record_path(assigns(:publication_record))
  end

  test "should show publication_record" do
    get :show, :id => @publication_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @publication_record
    assert_response :success
  end

  test "should update publication_record" do
    put :update, :id => @publication_record, :publication_record => { :academic_id => @publication_record.academic_id, :authorid => @publication_record.authorid, :resource => @publication_record.resource }
    assert_redirected_to publication_record_path(assigns(:publication_record))
  end

  test "should destroy publication_record" do
    assert_difference('PublicationRecord.count', -1) do
      delete :destroy, :id => @publication_record
    end

    assert_redirected_to publication_records_path
  end
end
