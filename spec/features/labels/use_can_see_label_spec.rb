# frozen_string_literal: true

require 'rails_helper'

feature 'Label ' do
  context 'user can see a label' do
    let(:user) { create(:user) }
    let(:glossary) { create(:glossary) }
    let(:label) { create(:label) }

    scenario 'in its own page' do
      sign_in user
      visit label_path(label)
      expect(page).to have_content label.name
    end

    scenario 'with the associated glossary entries' do
      sign_in user
      visit root_path
      create_glossary_entry_with_label(glossary, label)
      visit label_path(label)
      expect(page).to have_content glossary.term
    end
  end
end
