# frozen_string_literal: true

require 'rails_helper'
require 'glossary_helper'

feature 'Glossary creation' do
  context 'user can create glossary term' do
    let(:user) { create(:user) }
    let(:glossary) { build(:glossary) }

    scenario 'with valid inputs will save a new glossary entry' do
      sign_in user
      visit root_path
      create_glossary_entry(glossary)
      expect(page).to have_content glossary.term
      expect(page).to have_content glossary.definition
    end
  end
end
