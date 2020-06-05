# frozen_string_literal: true

require 'rails_helper'
require "sign_up_helper"

feature 'Glossary deletion' do
  context 'user can delete glossary term' do
    let(:user) { build(:user) }
    let(:glossary) { build(:glossary) }

    scenario 'will delete a new glossary entry' do
      sign_up(user)
      click_link 'Glossary'
      click_link 'Create new entry'
      expect(current_path).to eq '/glossaries/new'
      fill_in 'Term', with: glossary.term
      fill_in 'Definition', with: glossary.definition
      click_button 'Add entry'
      click_link glossary.term
      current_term = Glossary.find_by_term(glossary.term)
      expect(current_path).to eq "/glossaries/#{current_term.id}"
      click_link 'Delete'
      expect(current_path).to eq glossaries_path
      expect(page).not_to have_content glossary.term
    end
  end
end
