# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary creation' do
  context 'user can create glossary term' do
    let(:user) { create(:user) }
    let(:glossary) { build(:glossary) }
    let(:blank_glossary) { build(:glossary, term: '', definition: '') }

    scenario 'with valid inputs will save a new glossary entry' do
      sign_in user
      visit root_path
      create_glossary_entry(glossary)
      expect(page).to have_content glossary.term
      expect(page).to have_content glossary.definition
    end

    scenario 'with blank inputs will send error messages and will not save' do
      sign_in user
      visit root_path
      create_glossary_entry(blank_glossary)
      expect(page).not_to have_content glossary.definition
      expect(page).to have_content "Term can't be blank"
      expect(page).to have_content "Definition can't be blank"
    end
  end
end
