require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
    
    def setup
        
        @category = Category.new(name:"sports")
        
    end
    
    test "Category should be valid" do
       
       assert @category.valid?
        
    end
    
    test "category name should not be empty" do
        
        @category.name = " "
        
        assert_not @category.valid?
        
    end
    
    test "name should not be too short" do
        
        @category.name = "aa"
        
        assert_not @category.valid?
        
    end
    
    test "name should not be too long" do
        
        @category.name = "a"* 26
        
        assert_not @category.valid?
        
    end
    
end

    