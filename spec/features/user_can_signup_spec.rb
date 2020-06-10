# frozen_string_literal: true

require 'rails_helper'

feature 'User registration' do
  context 'user can sign up' do
    let(:user) { create(:user) }

    scenario 'with valid credentials will redirect the user to the home page' do
      sign_in user
      visit root_path
      expect(page).to have_content "Welcome #{user.email}!"
    end
  end
end
