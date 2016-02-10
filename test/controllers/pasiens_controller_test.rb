require 'test_helper'

class PasiensControllerTest < ActionController::TestCase
  setup do
    @pasien = pasiens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pasiens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pasien" do
    assert_difference('Pasien.count') do
      post :create, pasien: { alamat: @pasien.alamat, jenis_kartu_id: @pasien.jenis_kartu_id, jenis_kelamin: @pasien.jenis_kelamin, kartu_rm_id: @pasien.kartu_rm_id, kategori_id: @pasien.kategori_id, kelurahan_id: @pasien.kelurahan_id, nama: @pasien.nama, no_kartu: @pasien.no_kartu, umur: @pasien.umur }
    end

    assert_redirected_to pasien_path(assigns(:pasien))
  end

  test "should show pasien" do
    get :show, id: @pasien
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pasien
    assert_response :success
  end

  test "should update pasien" do
    patch :update, id: @pasien, pasien: { alamat: @pasien.alamat, jenis_kartu_id: @pasien.jenis_kartu_id, jenis_kelamin: @pasien.jenis_kelamin, kartu_rm_id: @pasien.kartu_rm_id, kategori_id: @pasien.kategori_id, kelurahan_id: @pasien.kelurahan_id, nama: @pasien.nama, no_kartu: @pasien.no_kartu, umur: @pasien.umur }
    assert_redirected_to pasien_path(assigns(:pasien))
  end

  test "should destroy pasien" do
    assert_difference('Pasien.count', -1) do
      delete :destroy, id: @pasien
    end

    assert_redirected_to pasiens_path
  end
end
