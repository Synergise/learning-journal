# frozen_string_literal: true

require 'rails_helper'
require "sign_up_helper"

feature 'Glossary creation' do
  context 'user can create glossary term' do
    let(:user) { build(:user) }
    let(:glossary) { build(:glossary) }

    scenario 'with valid inputs will save a new glossary entry' do
      sign_up(user)
      click_link 'Glossary'
      click_link 'Create new entry'
      expect(current_path).to eq '/glossaries/new'
      fill_in 'Term', with: glossary.term
      fill_in 'Definition', with: glossary.definition
      click_button 'Add entry'
      expect(current_path).to eq '/glossaries'
      expect(page).to have_content glossary.term
      expect(page).to have_content glossary.definition
    end
  end
end
