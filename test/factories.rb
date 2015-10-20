FactoryGirl.define do 
	factory :user do
		sequence :email do |n|
			"yoloman#{n}@gmail.com"
		end
		password "omglolhahaha"
		password_confirmation "omglolhahaha"
	end

	factory :course do
		title "yolo"
		description "omg"
		cost 0
		association :user
	end
end