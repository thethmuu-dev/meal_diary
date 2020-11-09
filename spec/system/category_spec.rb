require 'rails_helper'

RSpec.feature "Categories", type: :feature do

  describe "Category Management test" do
    context "Add new Category" do
      FactoryBot.create(:user)
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

    context "Edit a Category" do
      before(:each) do
        # user = FactoryBot.create(:user)
        visit root_path
        fill_in('Email', with: 'thet@gmail.com')
        fill_in('Password', with: 'thetthet')
        click_button "Log in"

        category = FactoryBot.create(:category1)
        click_link "View All"
        click_link "Edit Item", match: :first
        within("form") do
          fill_in('Title', with: 'Build Muscle Edited')
          click_button "Update Category"
        end 
      end
      it "Category is edited" do
        expect(page).to have_content("Build Muscle Edited")
      end
    end

    context 'Category List Display' do
      before(:each) do
        visit root_path
        fill_in('Email', with: 'thet@gmail.com')
        fill_in('Password', with: 'thetthet')
        click_button "Log in"
      end
      it 'The created category list is displayed' do
        # Transition to task list page
        visit categories_path
        expect(page).to have_content 'Categories'
        # Expect the result is true If the test is successful, if false, the result is output as a failure
      end
    end
  end


end