require 'test_helper'

class DisabilitiesControllerTest < ActionController::TestCase
  setup do
    @disability = disabilities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disabilities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disability" do
    assert_difference('Disability.count') do
      post :create, disability: { description: @disability.description, name: @disability.name }
    end

    assert_redirected_to disability_path(assigns(:disability))
  end

  test "should show disability" do
    get :show, id: @disability
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disability
    assert_response :success
  end

  test "should update disability" do
    patch :update, id: @disability, disability: { description: @disability.description, name: @disability.name }
    assert_redirected_to disability_path(assigns(:disability))
  end

  test "should destroy disability" do
    assert_difference('Disability.count', -1) do
      delete :destroy, id: @disability
    end

    assert_redirected_to disabilities_path
  end
end
