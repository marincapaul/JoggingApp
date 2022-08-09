require "test_helper"

class RunsEditTest < ActionDispatch::IntegrationTest
 
  def setup
    @user = users(:mike)
    @run = runs(:orange)
  end

  test "unsuccessful edit" do
    # log_in_as(@user)
    # get edit_user_path(@run)
    # assert_template 'users/edit'
    # patch run_path(@run), params: { run: { distance: "",
    #                                        time: "foo@invalid" } }
    # assert_template 'runs/edit'
  end
end
