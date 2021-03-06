require 'test_helper'

class ProposalsControllerTest < ActionController::TestCase
  setup do
    @proposal = proposals(:one)
    @enrolment = enrolments(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:proposals)
  end

  test "should get new" do
    get :new, :enrolment_id => @enrolment
    assert_response :success
  end

  test "should create proposal" do
    assert_difference('Proposal.count') do
      post :create, proposal: { academic_id: @proposal.academic_id, enrolment_id: @proposal.enrolment_id, title: @proposal.title }
    end

    assert_redirected_to enrolment_path(assigns(:proposal).enrolment)
  end

  test "should show proposal" do
    get :show, id: @proposal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @proposal
    assert_response :success
  end

  test "should update proposal" do
    put :update, id: @proposal, proposal: { academic_id: @proposal.academic_id, enrolment_id: @proposal.enrolment_id, title: @proposal.title }
    assert_redirected_to proposal_path(assigns(:proposal))
  end

  test "should destroy proposal" do
    @request.env['HTTP_REFERER'] = root_path
    assert_difference('Proposal.count', -1) do
      delete :destroy, id: @proposal
    end

    assert_redirected_to root_path
  end
end
