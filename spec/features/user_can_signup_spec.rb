# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'User registration' do
  context 'user can sign up' do
    let(:user) { build(:user) }

    scenario 'with valid credentials will redirect the user to the home page' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign up'
      expect(page).to have_content "Welcome #{user.email}!"
    end
  end
end
