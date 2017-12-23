require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
    
    def setup
        
        @category = Category.new(name: "sports")
        
        @category.save
        
        @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)

    end
    
    test "Get index" do
        
        get :index
        
        assert_response :success
        
    end
    
    test "Get new" do
        
        session[:user_id] = @user.id
        
        get :new
        
        assert_response :success
        
    end
    
    test "should get show" do
    
        get(:show, {'id' => @category.id})
        
        assert_response :success
    
    end
    
end
