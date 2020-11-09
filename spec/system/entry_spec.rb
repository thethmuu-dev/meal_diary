require 'rails_helper'

RSpec.feature "Entries", type: :feature do

  describe "Entry Management test" do
    context "Add new Entry" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
          click_button "Log in"
        end
      end
      it "New Entry is registered" do
        # FactoryBot.create(:category1, user_id: 1)
        click_link "Add Entry"
        fill_in('Meal type', with: 'Lunch')
        fill_in('Calories', with: 150)
        fill_in('Proteins', with: 50)
        fill_in('Carbohydrates', with: 10)
        fill_in('Fats', with: 3)
        select 'Build Muscle', from: :entry_category_id
        click_button "Create Entry"
        expect(page).to have_content("Entry saved.")
      end
    end

    context "Edit a Entry" do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
          click_button "Log in"
        end
      end
      it "Entry is edited" do
        # FactoryBot.create(:category1, user_id: 1)
        click_link "Add Entry"
        fill_in('Meal type', with: 'Lunch')
        fill_in('Calories', with: 150)
        fill_in('Proteins', with: 50)
        fill_in('Carbohydrates', with: 10)
        fill_in('Fats', with: 3)
        select 'Build Muscle', from: :entry_category_id
        click_button "Create Entry"
        visit entries_path
        click_link "Edit", match: :prefer_exact
        fill_in('Meal type', with: 'Dinner')
        click_button "Update Entry"
        expect(page).to have_content("Entry updated.")
      end
    end

    context 'Entry List Display' do
      before(:each) do
        visit root_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
          click_button "Log in"
        end
        # Create a task for use in testing
        # FactoryBot.create(:category1, user_id: 1)
        click_link "Add Entry"
        fill_in('Meal type', with: 'Lunch')
        fill_in('Calories', with: 150)
        fill_in('Proteins', with: 50)
        fill_in('Carbohydrates', with: 10)
        fill_in('Fats', with: 3)
        select 'Build Muscle', from: :entry_category_id
        click_button "Create Entry"
      end
      it 'The created entry list is displayed' do
        # Transition to task list page
        visit entries_path
        expect(page).to have_content 'Meal Records'
        # Expect the result is true If the test is successful, if false, the result is output as a failure
      end
    end
  end

end