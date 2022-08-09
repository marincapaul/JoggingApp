require "test_helper"

class RunsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @run = runs(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Run.count' do
      post runs_path, params: { run: { distance: 2.3, time: 5 } }
    end
    assert_redirected_to login_url
  end
    
  # test "should redirect destroy when not logged in" do
  #   assert_no_difference 'Run.count' do
  #     delete run_path(@run)
  #   end
  #   assert_redirected_to login_url
  # end
    
  test "should redirect update when not logged in" do
    assert_no_difference 'Run.count' do
      patch user_path(@run), params: { run: { distance: @run.distance,
                                              time: @run.time } }
      assert_not flash.empty?
      assert_redirected_to login_url
    end
  end
end
