require 'rails_helper'
require 'spec_helper'

feature "the goal-creation process" do
  let(:goal) {FactoryGirl.build(:goal)}

  it "redirects to log in page if not signed in" do
    visit "/goals/new"
    expect(page).to_not have_content("Goal" || "goal")
    expect(page).to have_content("Username")
  end

  it "redirects to goal show page upon creation" do
    sign_up_as_jeff
    visit "/goals/new"
    fill_in "Title", with: goal.title
    fill_in "Body", with: goal.body
    check "Private"
    click_button "Create Goal"
    expect(page).to have_content(goal.title)
  end

end
