require 'test_helper'

class PolisControllerTest < ActionController::TestCase
  setup do
    @poli = polis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:polis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create poli" do
    assert_difference('Poli.count') do
      post :create, poli: { nama: @poli.nama }
    end

    assert_redirected_to poli_path(assigns(:poli))
  end

  test "should show poli" do
    get :show, id: @poli
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @poli
    assert_response :success
  end

  test "should update poli" do
    patch :update, id: @poli, poli: { nama: @poli.nama }
    assert_redirected_to poli_path(assigns(:poli))
  end

  test "should destroy poli" do
    assert_difference('Poli.count', -1) do
      delete :destroy, id: @poli
    end

    assert_redirected_to polis_path
  end
end
