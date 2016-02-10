require 'test_helper'

class KunjungansControllerTest < ActionController::TestCase
  setup do
    @kunjungan = kunjungans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kunjungans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kunjungan" do
    assert_difference('Kunjungan.count') do
      post :create, kunjungan: { jenis_kartu_id: @kunjungan.jenis_kartu_id, jenis_kelamin: @kunjungan.jenis_kelamin, kartu_rm_id: @kunjungan.kartu_rm_id, kategori_id: @kunjungan.kategori_id, keluhan: @kunjungan.keluhan, kunjungan: @kunjungan.kunjungan, nama: @kunjungan.nama, no_kartu: @kunjungan.no_kartu, poli_id: @kunjungan.poli_id, umur: @kunjungan.umur }
    end

    assert_redirected_to kunjungan_path(assigns(:kunjungan))
  end

  test "should show kunjungan" do
    get :show, id: @kunjungan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kunjungan
    assert_response :success
  end

  test "should update kunjungan" do
    patch :update, id: @kunjungan, kunjungan: { jenis_kartu_id: @kunjungan.jenis_kartu_id, jenis_kelamin: @kunjungan.jenis_kelamin, kartu_rm_id: @kunjungan.kartu_rm_id, kategori_id: @kunjungan.kategori_id, keluhan: @kunjungan.keluhan, kunjungan: @kunjungan.kunjungan, nama: @kunjungan.nama, no_kartu: @kunjungan.no_kartu, poli_id: @kunjungan.poli_id, umur: @kunjungan.umur }
    assert_redirected_to kunjungan_path(assigns(:kunjungan))
  end

  test "should destroy kunjungan" do
    assert_difference('Kunjungan.count', -1) do
      delete :destroy, id: @kunjungan
    end

    assert_redirected_to kunjungans_path
  end
end
