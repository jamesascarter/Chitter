require 'spec_helper'

feature "User browses the list of all peeps" do

	before(:each) {
		Peep.create(:message => "Hello this is peep one",
								:name => "James Carter",
								:username => "jamesascarter")
	}

	scenario "user can see the cheeps" do
		visit '/'
		expect(page).to have_content("Hello this is peep one")
	end

	scenario "can see who wrote the cheep" do
		visit '/'
		expect(page).to have_content("jamesascarter")
	end


end