require 'test_helper'

class BookingsControllerTest < ActionController::TestCase
  setup do
    @booking = bookings(:one)
    @slot = slots(:new)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bookings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create booking" do
    assert_difference('Booking.count') do
      post :create, booking: { project_id: @booking.project_id, slot_id: @slot, venue_id: @booking.venue_id }
    end

    assert_redirected_to new_booking_path(project_id: assigns(:booking).project)
  end

  test "should show booking" do
    get :show, id: @booking
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @booking
    assert_response :success
  end

  test "should update booking" do
    put :update, id: @booking, booking: { project_id: @booking.project_id, slot_id: @slot, venue_id: @booking.venue_id }
    assert_redirected_to booking_path(assigns(:booking))
  end

  test "should destroy booking" do
    assert_difference('Booking.count', -1) do
      delete :destroy, id: @booking
    end

    assert_redirected_to new_booking_path(project_id: assigns(:booking).project)
  end
end
