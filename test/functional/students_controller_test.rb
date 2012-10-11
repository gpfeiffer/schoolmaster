require 'test_helper'

class StudentsControllerTest < ActionController::TestCase
  setup do
    @student = students(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:students)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post :create, :student => { :completed_on => @student.completed_on, :cosupervisor => @student.cosupervisor, :email => @student.email, :expected_on => @student.expected_on, :first => @student.first, :funder => @student.funder, :home_url => @student.home_url, :interests => @student.interests, :last => @student.last, :location => @student.location, :photo_url => @student.photo_url, :programme => @student.programme, :registration => @student.registration, :started_on => @student.started_on, :status => @student.status, :supervisor => @student.supervisor, :title => @student.title, :work_phone => @student.work_phone }
    end

    assert_redirected_to student_path(assigns(:student))
  end

  test "should show student" do
    get :show, :id => @student
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @student
    assert_response :success
  end

  test "should update student" do
    put :update, :id => @student, :student => { :completed_on => @student.completed_on, :cosupervisor => @student.cosupervisor, :email => @student.email, :expected_on => @student.expected_on, :first => @student.first, :funder => @student.funder, :home_url => @student.home_url, :interests => @student.interests, :last => @student.last, :location => @student.location, :photo_url => @student.photo_url, :programme => @student.programme, :registration => @student.registration, :started_on => @student.started_on, :status => @student.status, :supervisor => @student.supervisor, :title => @student.title, :work_phone => @student.work_phone }
    assert_redirected_to student_path(assigns(:student))
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete :destroy, :id => @student
    end

    assert_redirected_to students_path
  end
end
