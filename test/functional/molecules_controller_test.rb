require 'test_helper'

class MoleculesControllerTest < ActionController::TestCase
  setup do
    @molecule = molecules(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:molecules)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create molecule" do
    assert_difference('Molecule.count') do
      post :create, molecule: { code: @molecule.code, course_id: @molecule.course_id, description: @molecule.description, title: @molecule.title }
    end

    assert_redirected_to molecule_path(assigns(:molecule))
  end

  test "should show molecule" do
    get :show, id: @molecule
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @molecule
    assert_response :success
  end

  test "should update molecule" do
    put :update, id: @molecule, molecule: { code: @molecule.code, course_id: @molecule.course_id, description: @molecule.description, title: @molecule.title }
    assert_redirected_to molecule_path(assigns(:molecule))
  end

  test "should destroy molecule" do
    assert_difference('Molecule.count', -1) do
      delete :destroy, id: @molecule
    end

    assert_redirected_to molecules_path
  end
end
