# frozen_string_literal: true

require 'rails_helper'
require 'sign_up_helper'
require 'create_glossary_entry_helper'

feature 'Glossary creation' do
  context 'user can create glossary term' do
    let(:user) { build(:user) }
    let(:glossary) { build(:glossary) }

    scenario 'with valid inputs will save a new glossary entry' do
      sign_up(user)
      create_glossary_entry(glossary)
      current_term = Glossary.find_by(term: glossary.term)
      expect(current_path).to eq "/glossaries/#{current_term.id}"
      expect(page).to have_content glossary.term
      expect(page).to have_content glossary.definition
    end
  end
end
