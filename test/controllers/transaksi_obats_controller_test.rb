require 'test_helper'

class TransaksiObatsControllerTest < ActionController::TestCase
  setup do
    @transaksi_obat = transaksi_obats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:transaksi_obats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create transaksi_obat" do
    assert_difference('TransaksiObat.count') do
      post :create, transaksi_obat: { jumlah_ambil: @transaksi_obat.jumlah_ambil, jumlah_masuk: @transaksi_obat.jumlah_masuk, obat_id: @transaksi_obat.obat_id, pemakaian: @transaksi_obat.pemakaian, penerimaan: @transaksi_obat.penerimaan }
    end

    assert_redirected_to transaksi_obat_path(assigns(:transaksi_obat))
  end

  test "should show transaksi_obat" do
    get :show, id: @transaksi_obat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @transaksi_obat
    assert_response :success
  end

  test "should update transaksi_obat" do
    patch :update, id: @transaksi_obat, transaksi_obat: { jumlah_ambil: @transaksi_obat.jumlah_ambil, jumlah_masuk: @transaksi_obat.jumlah_masuk, obat_id: @transaksi_obat.obat_id, pemakaian: @transaksi_obat.pemakaian, penerimaan: @transaksi_obat.penerimaan }
    assert_redirected_to transaksi_obat_path(assigns(:transaksi_obat))
  end

  test "should destroy transaksi_obat" do
    assert_difference('TransaksiObat.count', -1) do
      delete :destroy, id: @transaksi_obat
    end

    assert_redirected_to transaksi_obats_path
  end
end
