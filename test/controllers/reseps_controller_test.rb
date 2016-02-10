require 'test_helper'

class ResepsControllerTest < ActionController::TestCase
  setup do
    @resep = reseps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reseps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create resep" do
    assert_difference('Resep.count') do
      post :create, resep: { jumlah_ambil: @resep.jumlah_ambil, obat_id: @resep.obat_id }
    end

    assert_redirected_to resep_path(assigns(:resep))
  end

  test "should show resep" do
    get :show, id: @resep
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @resep
    assert_response :success
  end

  test "should update resep" do
    patch :update, id: @resep, resep: { jumlah_ambil: @resep.jumlah_ambil, obat_id: @resep.obat_id }
    assert_redirected_to resep_path(assigns(:resep))
  end

  test "should destroy resep" do
    assert_difference('Resep.count', -1) do
      delete :destroy, id: @resep
    end

    assert_redirected_to reseps_path
  end
end
