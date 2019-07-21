FactoryBot.define do
	factory :story do
		sequence(:title) { |n| "title#{n}" }
    	sequence(:short_story) { |n| "short_story#{n}" }
    	sequence(:category) { |n| "category#{n}" }

    	trait :no_title do
      	  title {}
    	end

    	trait :no_short_story do
      	  short_story {}
    	end

    	trait :no_category do
      	  category {}
    	end

    	trait :too_long_title do
    	  title {}
    	end

    	trait :too_long_short_story do
      	  short_story { Faker::Lorem.characters(1276) }
   		end


	end
end