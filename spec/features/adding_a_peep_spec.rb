require 'spec_helper'

feature "User adds a new peep" do
	scenario "when on the homepage" do
		expect(Peep.count).to eq(0)
		visit '/'
		add_peep("This is my first peep")
		expect(Peep.count).to eq(1)
		peep = Peep.first
		expect(peep.message).to eq("This is my first peep")
	end

	def add_peep(message)
		within ('#new-peep') do
			fill_in 'message', :with => message
			click_button 'Peep!'
		end
	end

	end
