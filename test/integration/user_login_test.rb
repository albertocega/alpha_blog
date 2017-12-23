require 'test_helper'

class UserSignup < ActionDispatch::IntegrationTest
    
    
    test "user signup" do
        
        get signup_path
        
        assert_template 'users/new'
        
        assert_difference 'User.count', 1 do
        
           post_via_redirect users_path, user: {username: "benno", email: "hola@hola.com", password: "hola"}
    
        end
        
        assert_template 'articles/index'
        
        assert_match "benno", response.body
        
        
    end
    
end