# frozen_string_literal: true

require 'rails_helper'
require 'sign_up_helper'

feature 'User registration' do
  context 'user can sign up' do
    let(:user) { build(:user) }

    scenario 'with valid credentials will redirect the user to the home page' do
      sign_up(user)
      expect(page).to have_content "Welcome #{user.email}!"
    end
  end
end
