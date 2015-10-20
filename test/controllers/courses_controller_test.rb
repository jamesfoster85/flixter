require 'test_helper'

class CoursesControllerTest < ActionController::TestCase
  test "index" do
    FactoryGirl.create(:course)
    get :index
    assert_response :success
  end

  test "show found" do
  	course = FactoryGirl.create(:course)
  	get :show, :id => course.id
  	assert_response :success
  end
end
