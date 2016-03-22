require 'test_helper'

class DoktersControllerTest < ActionController::TestCase
  setup do
    @dokter = dokters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dokters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dokter" do
    assert_difference('Dokter.count') do
      post :create, dokter: { nama: @dokter.nama }
    end

    assert_redirected_to dokter_path(assigns(:dokter))
  end

  test "should show dokter" do
    get :show, id: @dokter
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dokter
    assert_response :success
  end

  test "should update dokter" do
    patch :update, id: @dokter, dokter: { nama: @dokter.nama }
    assert_redirected_to dokter_path(assigns(:dokter))
  end

  test "should destroy dokter" do
    assert_difference('Dokter.count', -1) do
      delete :destroy, id: @dokter
    end

    assert_redirected_to dokters_path
  end
end
