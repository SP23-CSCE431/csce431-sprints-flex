require "test_helper"

class PointCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_category = point_categories(:one)
  end

  test "should get index" do
    get point_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_point_category_url
    assert_response :success
  end

  test "should create point_category" do
    assert_difference("PointCategory.count") do
      post point_categories_url, params: { point_category: { name: @point_category.name, value: @point_category.value } }
    end

    assert_redirected_to point_category_url(PointCategory.last)
  end

  test "should show point_category" do
    get point_category_url(@point_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_point_category_url(@point_category)
    assert_response :success
  end

  test "should update point_category" do
    patch point_category_url(@point_category), params: { point_category: { name: @point_category.name, value: @point_category.value } }
    assert_redirected_to point_category_url(@point_category)
  end

  test "should destroy point_category" do
    assert_difference("PointCategory.count", -1) do
      delete point_category_url(@point_category)
    end

    assert_redirected_to point_categories_url
  end
end
