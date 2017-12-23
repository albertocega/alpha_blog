require 'test_helper'

class ArticleCreate < ActionDispatch::IntegrationTest
    
    def setup
        
        
        @user = User.create(username: "john", email: "john@example.com", password: "password", admin: true)

        
    end
    
    test "article create" do
        
        sign_in_as( @user, "password")
        
        get new_article_path
        
        assert_template 'articles/new'
        
        assert_difference 'Article.count', 1 do
        
           post_via_redirect articles_path, article: {title: "benno", description: "hola@hola.com", }
    
        end
        
        assert_template 'articles/show'
        
        assert_match "benno", response.body
        
        
    end
    
end