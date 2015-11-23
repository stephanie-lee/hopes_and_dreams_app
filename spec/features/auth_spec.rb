require 'spec_helper'
require 'rails_helper'

feature "the signup process" do
  before :each do
    visit "/users/new"
  end

  it "has a new user page" do
    expect(page).to have_selector("input[type=submit][value='Sign Up']")
  end

  feature "signing up a user" do
    let(:regular_user) { FactoryGirl.build(:user) }

    before :each do
      fill_in "Username", with: regular_user.username
      fill_in "Password", with: "password"
    end

    it "shows username on the homepage after signup" do
      click_button "Sign Up"
      #return to homepage
      expect(page).to have_content regular_user.username
    end
  end
end

feature "logging in" do
  let(:regular_user) { FactoryGirl.build(:user) }

  before :each do
    sign_up(regular_user.username)
  end

  it "shows username on the homepage after login" do
    sign_in(regular_user.username)
    expect(page).to have_content regular_user.username
  end
end

feature "logged out" do
  it "begins with logged out state" do
    visit "/users"
    expect(page).to_not have_button "Sign Out"
  end

  it "doesn't show username on the homepage after logout" do
    sign_up_as_jeff
    click_button "Sign Out"
    expect(page).to_not have_content "jeff"
  end
end
