# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary view' do
  context 'user can access glossary' do
    let(:user) { build(:user) }

    scenario 'displays glossary page for user' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign up'
      click_link 'Glossary'
      expect(current_path).to eq '/glossary'
    end
  end
end
