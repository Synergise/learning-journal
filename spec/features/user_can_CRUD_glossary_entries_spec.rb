# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary creation' do
  context 'user can create glossary term' do
    let(:user) { build(:user) }
    let(:glossary) { build(:glossary) }

    scenario 'with valid inputs will save a new glossary entry' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign up'
      click_link 'Glossary'
      click_link 'Add entry'
      expect(current_path).to eq '/glossaries/new'
      fill_in 'Term', with: glossary.term
      fill_in 'Definition', with: glossary.definition
      click_link 'Add to glossary'
      expect(page).to have_content 'Term added to glossary'
    end
  end
end
