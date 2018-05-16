require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest #controller tests are integration tests in rails5
  def setup
    @category = Category.create(name: "sports")
  end
  test "should get categories index" do
    get categories_path
    assert_response :success #ensure response of getting route is success
  end

  test "should get new" do
    get new_category_path
    assert_response :success #ensure response of getting route is success
  end

  test "should get show" do #need id of resource
    get category_path(@category) #pass whole object in because integration test
    assert_response :success #ensure response of getting route is success
  end
end
