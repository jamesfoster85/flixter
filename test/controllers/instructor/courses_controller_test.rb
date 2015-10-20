require 'test_helper'

class Instructor::CoursesControllerTest < ActionController::TestCase
	test "new not signed in" do
		get :new
		assert_redirected_to new_user_session_path
	end

	test "new" do
		user = FactoryGirl.create(:user)
		sign_in user
		get :new
		assert_response :success
	end

	test "create not signed in" do
		assert_no_difference 'Course.count' do
			post :create, {:course => {
					:title => 'yolo',
					:description => 'omg',
					:cost => 0
				}
			}
		end
		assert_redirected_to new_user_session_path
	end

  test "create" do
    user = FactoryGirl.create(:user)
    sign_in user

    assert_difference 'Course.count' do
    	post :create, {:course => {
    			:title => 'yolo',
    			:description => 'omg',
    			:cost => 0
    		}
   		}
  	end
  	course = Course.last
  	assert_redirected_to instructor_course_path(course)

  	assert_equal 1, user.courses.count
	end

	test "create invalid" do
		user = FactoryGirl.create(:user)
		sign_in user

		assert_no_difference 'Course.count' do
			post :create, {:course => {
					:title => '',
					:description => '',
					:cost => ''
				}
			}
		end

		assert_response :unprocessable_entity
	end

end