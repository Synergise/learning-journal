# frozen_string_literal: true

require 'rails_helper'

feature 'Label creation' do
  context 'user can create labels' do
    let(:user) { create(:user) }
    let(:glossary) { build(:glossary) }
    let(:label) { build(:label) }

    scenario 'with valid inputs will save a new label' do
      sign_in user
      visit root_path
      create_glossary_entry_with_label(glossary, label)
      expect(page).to have_content label.name
    end
  end
end
