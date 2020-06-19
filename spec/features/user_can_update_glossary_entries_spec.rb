# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary edit' do
  context 'user can edit glossary term' do
    let(:user) { create(:user) }
    let(:glossary) { create(:glossary) }
    let(:glossary2) { build(:glossary) }

    scenario 'with valid inputs will update a new glossary entry' do
      sign_in user
      visit "/glossaries/#{glossary.id}"
      edit_glossary_entry(glossary2)
      expect(page).to have_content glossary2.term
      expect(page).to have_content glossary2.definition
      expect(page).not_to have_content glossary.term
    end

    scenario 'with blank inputs sends a flash message but does not update' do
      sign_in user
      visit "/glossaries/#{glossary.id}"
      click_link 'Edit'
      fill_in_glossary_form('', '')
      click_button 'Update entry'
      expect(page).not_to have_content glossary2.term
      expect(page).not_to have_content glossary2.definition
      expect(page).not_to have_content glossary.term
      expect(page).not_to have_content glossary.definition
      expect(page).to have_content "term can't be blank, definition can't be blank"
    end
  end
end
