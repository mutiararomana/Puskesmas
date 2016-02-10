require 'test_helper'

class ObatMasuksControllerTest < ActionController::TestCase
  setup do
    @obat_masuk = obat_masuks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obat_masuks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obat_masuk" do
    assert_difference('ObatMasuk.count') do
      post :create, obat_masuk: { jumlah_masuk: @obat_masuk.jumlah_masuk, obat_id: @obat_masuk.obat_id, penerimaan: @obat_masuk.penerimaan }
    end

    assert_redirected_to obat_masuk_path(assigns(:obat_masuk))
  end

  test "should show obat_masuk" do
    get :show, id: @obat_masuk
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @obat_masuk
    assert_response :success
  end

  test "should update obat_masuk" do
    patch :update, id: @obat_masuk, obat_masuk: { jumlah_masuk: @obat_masuk.jumlah_masuk, obat_id: @obat_masuk.obat_id, penerimaan: @obat_masuk.penerimaan }
    assert_redirected_to obat_masuk_path(assigns(:obat_masuk))
  end

  test "should destroy obat_masuk" do
    assert_difference('ObatMasuk.count', -1) do
      delete :destroy, id: @obat_masuk
    end

    assert_redirected_to obat_masuks_path
  end
end
