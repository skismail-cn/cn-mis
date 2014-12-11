require 'test_helper'

class LeavetypesControllerTest < ActionController::TestCase
  setup do
    @leavetype = leavetypes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:leavetypes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create leavetype" do
    assert_difference('Leavetype.count') do
      post :create, leavetype: { name: @leavetype.name, status: @leavetype.status }
    end

    assert_redirected_to leavetype_path(assigns(:leavetype))
  end

  test "should show leavetype" do
    get :show, id: @leavetype
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @leavetype
    assert_response :success
  end

  test "should update leavetype" do
    patch :update, id: @leavetype, leavetype: { name: @leavetype.name, status: @leavetype.status }
    assert_redirected_to leavetype_path(assigns(:leavetype))
  end

  test "should destroy leavetype" do
    assert_difference('Leavetype.count', -1) do
      delete :destroy, id: @leavetype
    end

    assert_redirected_to leavetypes_path
  end
end
