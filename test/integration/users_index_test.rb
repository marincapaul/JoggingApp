require "test_helper"

class UsersIndexTest < ActionDispatch::IntegrationTest
  
  def setup
    @manager = users(:mike)
    @non_manager = users(:archer)
  end
    
  test "index including pagination" do
    log_in_as(@manager)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    User.paginate(page: 1).each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
    end
  end
      
  test "index as admin including pagination and delete links" do
    log_in_as(@manager)
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page_of_users = User.paginate(page: 1)
    first_page_of_users.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @manager
        assert_select 'a[href=?]', user_path(user), text: 'delete'
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path(@non_manager)
    end
  end

  test "index as non-admin" do
    log_in_as(@non_manager)
    get users_path
    assert_select 'a', text: 'delete', count: 0
  end
    
 end
