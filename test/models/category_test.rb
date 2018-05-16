require 'test_helper'

class CatergoryTest < ActiveSupport::TestCase

  def setup # runs before every test
    @category = Category.new(name: "sports") #will not hit dev db
  end

  test "category should be valid" do
    assert @category.valid? #can we initiate a new category instance variable and valid?
  end

  test "name should be present" do
    @category.name = " "
    assert_not @category.valid? #test will pass if return false, assert not testing negative, testing for validations of category object
  end

  test "name should be unique" do
    @category.save
    @category2 = Category.new(name: "sports")
    assert_not @category2.valid? #testing if validation is present for duplication of names
  end

  test "name should not be too long" do
    @category.name = "a" * 26
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.name = "a" * 2
    assert_not @category.valid?
  end

end
