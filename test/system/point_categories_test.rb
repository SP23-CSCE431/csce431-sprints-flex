require "application_system_test_case"

class PointCategoriesTest < ApplicationSystemTestCase
  setup do
    @point_category = point_categories(:one)
  end

  test "visiting the index" do
    visit point_categories_url
    assert_selector "h1", text: "Point categories"
  end

  test "should create point category" do
    visit point_categories_url
    click_on "New point category"

    fill_in "Name", with: @point_category.name
    fill_in "Value", with: @point_category.value
    click_on "Create Point category"

    assert_text "Point category was successfully created"
    click_on "Back"
  end

  test "should update Point category" do
    visit point_category_url(@point_category)
    click_on "Edit this point category", match: :first

    fill_in "Name", with: @point_category.name
    fill_in "Value", with: @point_category.value
    click_on "Update Point category"

    assert_text "Point category was successfully updated"
    click_on "Back"
  end

  test "should destroy Point category" do
    visit point_category_url(@point_category)
    click_on "Destroy this point category", match: :first

    assert_text "Point category was successfully destroyed"
  end
end
