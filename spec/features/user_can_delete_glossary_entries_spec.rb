# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary deletion' do
  context 'user can delete glossary term' do
    let(:user) { build(:user) }
    let(:glossary) { build(:glossary) }

    scenario 'will delete a new glossary entry' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password_confirmation
      click_button 'Sign up'
      click_link 'Glossary'
      click_link 'Create new entry'
      expect(current_path).to eq '/glossaries/new'
      fill_in 'Term', with: glossary.term
      fill_in 'Definition', with: glossary.definition
      click_button 'Add entry'
      click_link glossary.term
      currentTerm = Glossary.find_by_term(glossary.term)
      expect(current_path).to eq "/glossaries/#{currentTerm.id}"
      click_link 'Delete'
      expect(current_path).to eq glossaries_path
      expect(page).not_to have_content glossary.term
      expect(page).not_to have_content glossary.definition
    end
  end
end
