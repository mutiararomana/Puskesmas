require 'test_helper'

class RekamMediksControllerTest < ActionController::TestCase
  setup do
    @rekam_medik = rekam_mediks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rekam_mediks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rekam_medik" do
    assert_difference('RekamMedik.count') do
      post :create, rekam_medik: { kartu_rm_id: @rekam_medik.kartu_rm_id, keluhan: @rekam_medik.keluhan, nama: @rekam_medik.nama, penyakit_id: @rekam_medik.penyakit_id, terapi: @rekam_medik.terapi, tindakan: @rekam_medik.tindakan }
    end

    assert_redirected_to rekam_medik_path(assigns(:rekam_medik))
  end

  test "should show rekam_medik" do
    get :show, id: @rekam_medik
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rekam_medik
    assert_response :success
  end

  test "should update rekam_medik" do
    patch :update, id: @rekam_medik, rekam_medik: { kartu_rm_id: @rekam_medik.kartu_rm_id, keluhan: @rekam_medik.keluhan, nama: @rekam_medik.nama, penyakit_id: @rekam_medik.penyakit_id, terapi: @rekam_medik.terapi, tindakan: @rekam_medik.tindakan }
    assert_redirected_to rekam_medik_path(assigns(:rekam_medik))
  end

  test "should destroy rekam_medik" do
    assert_difference('RekamMedik.count', -1) do
      delete :destroy, id: @rekam_medik
    end

    assert_redirected_to rekam_mediks_path
  end
end
