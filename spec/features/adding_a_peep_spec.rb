require 'spec_helper'

feature "User adds a new peep" do

  before(:each) do
    User.create(:email                 => 'test@test.com',
                :password              => 'test',
                :password_confirmation => 'test')
  end


  scenario "when on the homepage and signed in" do
    expect(Peep.count).to eq(0)
    sign_in('test@test.com', 'test')
    visit '/'
    add_peep("This is my first peep")
    expect(Peep.count).to eq(1)
    peep = Peep.first
    expect(peep.message).to eq("This is my first peep")
  end

  scenario "but can not when is not signed in" do
    visit '/'
    expect(page).not_to have_content('Peep:')
  end

  def add_peep(message)
    within ('#new-peep') do
      fill_in 'message', :with => message
      click_button 'Peep!'
    end
  end

end
