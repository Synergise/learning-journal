# frozen_string_literal: true

require 'rails_helper'
require 'sign_up_helper'
require 'create_glossary_entry_helper'

feature 'Glossary edit' do
  context 'user can edit glossary term' do
    let(:user) { build(:user) }
    let(:glossary) { build(:glossary) }
    let(:glossary2) { build(:glossary) }

    scenario 'with valid inputs will update a new glossary entry' do
      sign_up(user)
      create_glossary_entry(glossary)
      click_link glossary.term
      current_term = Glossary.find_by_term(glossary.term)
      expect(current_path).to eq "/glossaries/#{current_term.id}"
      click_link 'Edit'
      fill_in 'Term', with: glossary2.term
      fill_in 'Definition', with: glossary2.definition
      click_button 'Update'
      expect(page).to have_content glossary2.term
      expect(page).to have_content glossary2.definition
      expect(page).not_to have_content glossary.term
    end
  end
end
