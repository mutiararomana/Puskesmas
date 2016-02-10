require 'test_helper'

class ObatsControllerTest < ActionController::TestCase
  setup do
    @obat = obats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:obats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create obat" do
    assert_difference('Obat.count') do
      post :create, obat: { harga: @obat.harga, nama: @obat.nama, stok: @obat.stok, stok_awal: @obat.stok_awal }
    end

    assert_redirected_to obat_path(assigns(:obat))
  end

  test "should show obat" do
    get :show, id: @obat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @obat
    assert_response :success
  end

  test "should update obat" do
    patch :update, id: @obat, obat: { harga: @obat.harga, nama: @obat.nama, stok: @obat.stok, stok_awal: @obat.stok_awal }
    assert_redirected_to obat_path(assigns(:obat))
  end

  test "should destroy obat" do
    assert_difference('Obat.count', -1) do
      delete :destroy, id: @obat
    end

    assert_redirected_to obats_path
  end
end
