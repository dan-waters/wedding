require 'test_helper'

class HoneymoonsControllerTest < ActionController::TestCase
  setup do
    @honeymoon = honeymoons(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:honeymoons)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create honeymoon" do
    assert_difference('Honeymoon.count') do
      post :create, honeymoon: { from: @honeymoon.from, to: @honeymoon.to }
    end

    assert_redirected_to honeymoon_path(assigns(:honeymoon))
  end

  test "should show honeymoon" do
    get :show, id: @honeymoon
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @honeymoon
    assert_response :success
  end

  test "should update honeymoon" do
    patch :update, id: @honeymoon, honeymoon: { from: @honeymoon.from, to: @honeymoon.to }
    assert_redirected_to honeymoon_path(assigns(:honeymoon))
  end

  test "should destroy honeymoon" do
    assert_difference('Honeymoon.count', -1) do
      delete :destroy, id: @honeymoon
    end

    assert_redirected_to honeymoons_path
  end
end
