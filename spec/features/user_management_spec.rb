require 'spec_helper'

feature "User signs up" do

	scenario "for the first time" do
		expect{ sign_up }.to change(User, :count).by(1)
		expect(page).to have_content("Welcome, james@gmail.com")
		expect(User.first.email).to eq("james@gmail.com")
	end

	scenario "with a password that does'nt match" do
		expect{ sign_up('a@a.com', 'pass', 'wrong')}.to change(User, :count).by(0)
		expect(current_path).to eq('/users')
		expect(page).to have_content("Sorry, your passwords don't match")
	end




	def sign_up(email = "james@gmail.com", password = "password", password_confirmation = "password")
		visit '/users/new'
		expect(page.status_code).to eq(200)
		fill_in :email, :with => email
		fill_in :password, :with => password
		fill_in :password_confirmation, :with => password_confirmation
		click_button 'Sign up'
	end

end