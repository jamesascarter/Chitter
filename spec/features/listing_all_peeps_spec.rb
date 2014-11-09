require 'spec_helper'

feature "User browses the list of all peeps" do

  before(:each) {

    @user = User.create(:name                  => 'james',
                        :username              => 'jamesascarter',
                        :email                 => 'test@test.com',
                        :password              => 'test',
                        :password_confirmation => 'test')

    Peep.create(:message => "Hello this is peep one",
                :user_id => @user.id)
    Peep.create(:message => "Hello this is peep two",
                :user_id => @user.id)
  }

  scenario "user can see the peeps" do
    visit '/'
    expect(page).to have_content("Hello this is peep one")
  end

  scenario "can see the name of who wrote the peep" do
    visit '/'
    expect(page).to have_content("jamesascarter")
  end

  scenario "can see username of who wrote the peep " do
    visit '/'
    expect(page).to have_content("james")
  end

  scenario "and most recent peep is listed at the top of the list" do
    visit '/'
    "Hello this is peep two".should appear_before("Hello this is peep one")
  end
end