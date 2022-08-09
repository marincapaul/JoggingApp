require "test_helper"

class RunTest < ActiveSupport::TestCase
  def setup
    @user = users(:mike)
    @run = @user.runs.build(distance: 2.3, time: 15)
  end

  test "should be valid" do
    assert @run.valid?
  end

  test "user id should be present" do
    @run.user_id = nil
    assert_not @run.valid?
  end

  test "distance should be present" do
    @run.distance = nil
    assert_not @run.valid?
    @run.distance = "21s"
    assert_not @run.valid?
  end

  test "time should be present" do
    @run.time = nil
    assert_not @run.valid?
    @run.time = "12s"
    assert_not @run.valid?
  end

  test "order should be most recent first" do
    assert_equal runs(:most_recent), Run.first
  end
    

end
