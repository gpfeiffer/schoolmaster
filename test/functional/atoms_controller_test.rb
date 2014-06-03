require 'test_helper'

class AtomsControllerTest < ActionController::TestCase
  setup do
    @atom = atoms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atoms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atom" do
    assert_difference('Atom.count') do
      post :create, atom: { code: @atom.code, description: @atom.description, discipline: @atom.discipline, hours: @atom.hours, semester: @atom.semester, times: @atom.times, title: @atom.title, weeks: @atom.weeks }
    end

    assert_redirected_to atom_path(assigns(:atom))
  end

  test "should show atom" do
    get :show, id: @atom
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atom
    assert_response :success
  end

  test "should update atom" do
    put :update, id: @atom, atom: { code: @atom.code, description: @atom.description, discipline: @atom.discipline, hours: @atom.hours, semester: @atom.semester, times: @atom.times, title: @atom.title, weeks: @atom.weeks }
    assert_redirected_to atom_path(assigns(:atom))
  end

  test "should destroy atom" do
    assert_difference('Atom.count', -1) do
      delete :destroy, id: @atom
    end

    assert_redirected_to atoms_path
  end
end
