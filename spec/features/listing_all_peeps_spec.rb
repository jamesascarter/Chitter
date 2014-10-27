require 'spec_helper'

feature "User browses the list of all peeps" do

	before(:each) {
		Peep.create(:message => "Hello this is peep one",
								:name => "James Carter",
								:username => "jamesascarter")
		Peep.create(:message => "Hello this is peep two",
								:name => "James Carter",
								:username => "jamesascarter")
	}

	scenario "user can see the peeps" do
		visit '/'
		expect(page).to have_content("Hello this is peep one")
	end

	scenario "can see who wrote the peep" do
		visit '/'
		expect(page).to have_content("jamesascarter")
	end

	scenario "and most recent peep is listed at the top of the list" do
		visit '/'
		"Hello this is peep two".should appear_before("Hello this is peep one")
	end
end