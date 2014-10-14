require 'test_helper'

class BondsControllerTest < ActionController::TestCase
  setup do
    @bond = bonds(:one)
    @molecule = molecules(:one)
    sign_in users(:admin)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bonds)
  end

  test "should get new" do
    get :new, molecule_id: @molecule
    assert_response :success
  end

  test "should create bond" do
    assert_difference('Bond.count') do
      post :create, bond: { atom_id: @bond.atom_id, molecule_id: @bond.molecule_id }
    end

    assert_redirected_to molecule_path(assigns(:bond).molecule)
  end

  test "should show bond" do
    get :show, id: @bond
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bond
    assert_response :success
  end

  test "should update bond" do
    put :update, id: @bond, bond: { atom_id: @bond.atom_id, molecule_id: @bond.molecule_id }
    assert_redirected_to molecule_path(assigns(:bond).molecule)
  end

  test "should destroy bond" do
    assert_difference('Bond.count', -1) do
      delete :destroy, id: @bond
    end

    assert_redirected_to bonds_path
  end
end
