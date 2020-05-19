require 'rails_helper'

describe 'registration' do
  context 'user can sign up' do
    let(:user) { build(:user) }

    it 'takes user to home page upon successful registration' do
      visit "/"
      fill_in "Email", with: user.email
      fill_in "Username", with: user.usernam
      fill_in "Password", with: user.password
      fill_in "Confirm password", with: user.password2 
      click_button "Sign up"
      expect(page).to have_content "Welcome #{user.username}!"
    end
  end
end