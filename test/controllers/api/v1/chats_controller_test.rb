require 'test_helper'

class Api::V1::ChatsControllerTest < ActionController::TestCase
  setup do
    @api_v1_chat = api_v1_chats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:api_v1_chats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create api_v1_chat" do
    assert_difference('Api::V1::Chat.count') do
      post :create, api_v1_chat: {  }
    end

    assert_redirected_to api_v1_chat_path(assigns(:api_v1_chat))
  end

  test "should show api_v1_chat" do
    get :show, id: @api_v1_chat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @api_v1_chat
    assert_response :success
  end

  test "should update api_v1_chat" do
    patch :update, id: @api_v1_chat, api_v1_chat: {  }
    assert_redirected_to api_v1_chat_path(assigns(:api_v1_chat))
  end

  test "should destroy api_v1_chat" do
    assert_difference('Api::V1::Chat.count', -1) do
      delete :destroy, id: @api_v1_chat
    end

    assert_redirected_to api_v1_chats_path
  end
end
