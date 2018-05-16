require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and create category" do
    get new_category_path
    assert_template 'categories/new' #new form
    assert_difference 'Category.count', 1 do #should be a difference of 1 for category count after do action
      post categories_path, params: { category: {name: "sports"} } #create action is a post
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "sports", response.body #index page should have 'sports'
  end

  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new' #new form
    assert_no_difference 'Category.count' do #make sure no difference after the following action
      post categories_path, params: { category: {name: " "} } #not supposed to create blank category
    end
    assert_template 'categories/new'
    #assert_select 'h2.panel-title', response.body #index page should have 'sports'
    #assert_select 'div.panel-body' # ref views page, to show errors partial being rendered
  end
end
