require 'rails_helper'

RSpec.feature "Users", type: :feature do

  describe "User registration test" do
    context "Register new user" do
      before(:each) do
        visit new_user_session_path
        click_link "Sign Up"
        within("form") do
          fill_in('Username', with: 'Zaw Zaw')
          fill_in('Email', with: 'zawzaw@gmail.com')
          fill_in('Password', with: 'zawzaw')
          fill_in('Password confirmation', with: 'zawzaw')
        end
      end
      it "New user is registered" do
        click_button "Sign up"
        expect(page).to have_content("Welcome! You have signed up successfully.")
      end
    end

    context "Check index page without login" do
      before(:each) do
        visit root_path
      end
      it "Redirect to login with message" do
        expect(page).to have_content("You need to sign in or sign up before continuing.")
      end
    end
  end

  describe "Testing session functionality" do
    context "Be able to login" do
      # FactoryBot.create(:user)
      before(:each) do
        visit new_user_session_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
        end
      end
      it "Login test pass" do
        click_button "Log in"
        expect(page).to have_content("Signed in successfully.")
      end
    end

    context "View edit profile page" do
      before(:each) do
        visit new_user_session_path
        within("form") do
          fill_in('Email', with: 'thet@gmail.com')
          fill_in('Password', with: 'thetthet')
        end
      end
      it "User edit profile test pass" do
        click_button "Log in"
        click_link "Edit Profile"
        expect(page).to have_content("Edit Your Profile")
      end
    end
  end

end