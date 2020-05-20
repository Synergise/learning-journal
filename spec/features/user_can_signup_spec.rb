require 'rails_helper'

describe 'registration' do
  context 'user can sign up' do
    let(:user) { build(:user) }

    it 'takes user to home page upon successful registration' do
      visit "/"
      click_link "Sign up"
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      fill_in "Password confirmation", with: user.password_confirmation 
      click_button "Sign up"
      expect(page).to have_content "Welcome #{user.email}!"
    end
  end
end
