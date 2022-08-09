require "test_helper"

class UsersFilterTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:mike)
  end

  test "filter runs" do
    log_in_as(@user)
    get root_path
    opt = {}
    opt[:from] = 1.week.ago
    opt[:to] = Time.zone.now
    
    assert_equal @user.feed(opt).count.to_s, '3'
    #assert_not @user.feed(opt).count.to_s, '3'
     
  end
end
