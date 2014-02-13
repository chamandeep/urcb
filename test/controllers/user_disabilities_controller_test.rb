require 'test_helper'

class UserDisabilitiesControllerTest < ActionController::TestCase
  setup do
    @user_disability = user_disabilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_disabilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_disability" do
    assert_difference('UserDisability.count') do
      post :create, user_disability: { disability_id: @user_disability.disability_id, severity: @user_disability.severity, supportRequired: @user_disability.supportRequired, user_id: @user_disability.user_id }
    end

    assert_redirected_to user_disability_path(assigns(:user_disability))
  end

  test "should show user_disability" do
    get :show, id: @user_disability
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_disability
    assert_response :success
  end

  test "should update user_disability" do
    patch :update, id: @user_disability, user_disability: { disability_id: @user_disability.disability_id, severity: @user_disability.severity, supportRequired: @user_disability.supportRequired, user_id: @user_disability.user_id }
    assert_redirected_to user_disability_path(assigns(:user_disability))
  end

  test "should destroy user_disability" do
    assert_difference('UserDisability.count', -1) do
      delete :destroy, id: @user_disability
    end

    assert_redirected_to user_disabilities_path
  end
end
