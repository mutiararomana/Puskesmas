require 'test_helper'

class PenyakitsControllerTest < ActionController::TestCase
  setup do
    @penyakit = penyakits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:penyakits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create penyakit" do
    assert_difference('Penyakit.count') do
      post :create, penyakit: { jenis_penyakit_id: @penyakit.jenis_penyakit_id, nama: @penyakit.nama }
    end

    assert_redirected_to penyakit_path(assigns(:penyakit))
  end

  test "should show penyakit" do
    get :show, id: @penyakit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @penyakit
    assert_response :success
  end

  test "should update penyakit" do
    patch :update, id: @penyakit, penyakit: { jenis_penyakit_id: @penyakit.jenis_penyakit_id, nama: @penyakit.nama }
    assert_redirected_to penyakit_path(assigns(:penyakit))
  end

  test "should destroy penyakit" do
    assert_difference('Penyakit.count', -1) do
      delete :destroy, id: @penyakit
    end

    assert_redirected_to penyakits_path
  end
end
