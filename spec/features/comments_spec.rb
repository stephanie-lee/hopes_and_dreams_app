require 'rails_helper'
require 'spec_helper'

describe "user comments" do
  feature "writing comments" do
    let!(:first_user) {FactoryGirl.create(:user)}
    let!(:second_user) {FactoryGirl.create(:user)}
    let!(:comment) {FactoryGirl.create(:user_comment,
                                       author: second_user,
                                       user: first_user)}

    it "displays comment form on user's show page" do
      visit user_url(first_user)
      expect(page).to have_button "Add Comment"
    end

    it "adds comment to user show page" do
      visit user_url(first_user)
      expect(page).to have_content comment.body
    end
  end

  feature "viewing comments" do
    it "displays author of comment" do

    end

    it "displays body of comment" do

    end
  end
end

describe "goal comments" do
  feature "writing comments" do
    it "displays comment form on goal's show page" do

    end

    it "adds comment to goal show page" do


    end
  end

  feature "viewing comments" do
    it "displays author of comment" do

    end

    it "displays body of comment" do

    end
  end
end
