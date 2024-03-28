require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  def test_should_get_index
    get tasks_url
    assert_response :success
  end
end
