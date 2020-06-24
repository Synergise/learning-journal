# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary edit' do
  context 'user can edit glossary term' do
    let(:user) { create(:user) }
    let!(:glossary) { create(:glossary) }
    let(:updated_glossary) { build(:glossary) }
    let(:blank_glossary) { build(:glossary, term: '', definition: '') }

    scenario 'with valid inputs will update a new glossary entry' do
      sign_in user
      visit glossary_path(glossary)
      edit_glossary_entry(updated_glossary)
      expect(page).to have_content updated_glossary.term
      expect(page).to have_content updated_glossary.definition
      expect(page).not_to have_content glossary.term
    end

    scenario 'with blank inputs sends error messages but does not update' do
      sign_in user
      visit glossary_path(glossary)
      edit_glossary_entry(blank_glossary)
      expect(page).not_to have_content updated_glossary.term
      expect(page).not_to have_content updated_glossary.definition
      expect(page).to have_content "Term can't be blank"
      expect(page).to have_content "Definition can't be blank"
    end
  end
end
