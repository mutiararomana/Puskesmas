require 'test_helper'

class JenisPenyakitsControllerTest < ActionController::TestCase
  setup do
    @jenis_penyakit = jenis_penyakits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jenis_penyakits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jenis_penyakit" do
    assert_difference('JenisPenyakit.count') do
      post :create, jenis_penyakit: { nama: @jenis_penyakit.nama }
    end

    assert_redirected_to jenis_penyakit_path(assigns(:jenis_penyakit))
  end

  test "should show jenis_penyakit" do
    get :show, id: @jenis_penyakit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jenis_penyakit
    assert_response :success
  end

  test "should update jenis_penyakit" do
    patch :update, id: @jenis_penyakit, jenis_penyakit: { nama: @jenis_penyakit.nama }
    assert_redirected_to jenis_penyakit_path(assigns(:jenis_penyakit))
  end

  test "should destroy jenis_penyakit" do
    assert_difference('JenisPenyakit.count', -1) do
      delete :destroy, id: @jenis_penyakit
    end

    assert_redirected_to jenis_penyakits_path
  end
end
