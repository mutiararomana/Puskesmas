require 'test_helper'

class JenisKartusControllerTest < ActionController::TestCase
  setup do
    @jenis_kartu = jenis_kartus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:jenis_kartus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create jenis_kartu" do
    assert_difference('JenisKartu.count') do
      post :create, jenis_kartu: { nama: @jenis_kartu.nama }
    end

    assert_redirected_to jenis_kartu_path(assigns(:jenis_kartu))
  end

  test "should show jenis_kartu" do
    get :show, id: @jenis_kartu
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @jenis_kartu
    assert_response :success
  end

  test "should update jenis_kartu" do
    patch :update, id: @jenis_kartu, jenis_kartu: { nama: @jenis_kartu.nama }
    assert_redirected_to jenis_kartu_path(assigns(:jenis_kartu))
  end

  test "should destroy jenis_kartu" do
    assert_difference('JenisKartu.count', -1) do
      delete :destroy, id: @jenis_kartu
    end

    assert_redirected_to jenis_kartus_path
  end
end
