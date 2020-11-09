require 'rails_helper'

RSpec.describe "DietPlans", type: :feature do
  describe "Diet Plan Management test" do
    context "Add new Diet Plan" do
      before(:each) do
        visit root_path
        fill_in('Email', with: 'thet@gmail.com')
        fill_in('Password', with: 'thetthet')
        click_button "Log in"
      end
      it "New Diet Plan is registered" do
        visit new_diet_plan_path
        fill_in('Calories', with: 150)
        fill_in('Proteins', with: 50)
        fill_in('Carbohydrates', with: 10)
        fill_in('Fats', with: 3)
        click_button "Create Diet plan"
        expect(page).to have_content("Your Diet Goal Set Successfully!")
      end
    end

    context "Edit a Diet Plan" do
      before(:each) do
        visit root_path
        fill_in('Email', with: 'thet@gmail.com')
        fill_in('Password', with: 'thetthet')
        click_button "Log in"
      end
      it "Diet Plan is edited" do
        visit new_diet_plan_path
        fill_in('Calories', with: 150)
        fill_in('Proteins', with: 50)
        fill_in('Carbohydrates', with: 10)
        fill_in('Fats', with: 3)
        click_button "Create Diet plan"
        
        visit diet_plans_path
        click_link "Edit Goal"
        fill_in('Calories', with: 1500)
        click_button "Update Diet plan"
        expect(page).to have_content("Your Diet Goal Updated Successfully!")
      end
    end
    
  end
end
