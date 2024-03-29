require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    test "root page" do
      get root_path
      assert_template 'static_pages/home'
      assert_select "a[href=?]", root_path, count:2
      assert_select "a[href=?]", help_path
      assert_select "a[href=?]", about_path
      assert_select "a[href=?]", contact_path
    end
    
    test "contact page" do
      get contact_path
      assert_select "title", full_title("Contact")
    end 

    test "signup page" do
      get signup_path
      assert_select "title", full_title("Sign up")
    end
  end
end
