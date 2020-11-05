require 'rails_helper'

RSpec.feature "Categories", type: :feature do

  describe "Category registration test" do
    context "Add new Category" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
          click_button "Log in"
        end
      end
      it "New Category is registered" do
        click_link "Add New"
        fill_in('Title', with: 'Build Muscle')
        click_button "Create Category"
        expect(page).to have_content("Category saved.")
      end
    end
  end
  
  describe "Category edit test" do
    context "Edit a Category" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
          click_button "Log in"
        end
      end
      it "Category is edited" do
        FactoryBot.create(:category1)
        click_link "View All"
        click_link "Edit Item", match: :first
        fill_in('Title', with: 'Build Muscle Edited')
        click_button "Update Category"
        expect(page).to have_content("Build Muscle")
      end
    end
  end
  


end