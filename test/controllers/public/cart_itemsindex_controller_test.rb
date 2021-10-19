require 'test_helper'

class Public::CartItemsindexControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_cart_itemsindex_create_url
    assert_response :success
  end

  test "should get update" do
    get public_cart_itemsindex_update_url
    assert_response :success
  end

  test "should get destroy" do
    get public_cart_itemsindex_destroy_url
    assert_response :success
  end

  test "should get destroy_all" do
    get public_cart_itemsindex_destroy_all_url
    assert_response :success
  end

end
