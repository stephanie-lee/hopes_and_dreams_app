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

feature "display goals index page" do
  let!(:first_user) {FactoryGirl.create(:user)}
  let!(:second_user) {FactoryGirl.create(:user)}
  let!(:public_goal) {FactoryGirl.create(:goal, user: second_user)}
  let!(:private_goal) {
    FactoryGirl.create(:goal,
                      private_goal: true,
                      user: second_user)
                    }

  it "displays all public goals" do
    sign_in(first_user.username)
    visit goals_url
    expect(page).to have_content(public_goal.title)
  end

  it "does not display other users' private goals" do
    sign_in(first_user.username)
    visit goals_url
    expect(page).to_not have_content(private_goal.title)
  end

  it "links goals to goal show page" do
    sign_in(second_user.username)
    visit goals_url
    click_link(public_goal.title)
    expect(page).to have_content(public_goal.body)
  end
end


feature "edit goals" do
  let!(:first_user) {FactoryGirl.create(:user)}
  let!(:second_user) {FactoryGirl.create(:user)}
  let!(:public_goal) {FactoryGirl.create(:goal, user: second_user)}
  let!(:private_goal) {
    FactoryGirl.create(:goal,
                      private_goal: true,
                      user: second_user)
                    }

  it "brings user to edit page from show page" do
    visit goal_url(public_goal)
    click_link("Edit Goal")
    expect(page).to have_field("Title")
    expect(page).to have_selector("input[type=submit][value='Edit Goal']")
  end

  it "redirects user to goals index after editing" do
    visit edit_goal_url(public_goal)
    click_button("Edit Goal")
    expect(page).to have_content "Goals"
  end

  it "updates edited fields" do


  end

  it "if user clicks 'Goal Completed!', 'completed' attribute is now true" do

  end
end
