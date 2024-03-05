require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get bulletins_url
    assert_response :success
  end

  test 'should get show' do
    get bulletins_url(bulletins(:bulletin1).id)
    assert_response :success
  end
end
