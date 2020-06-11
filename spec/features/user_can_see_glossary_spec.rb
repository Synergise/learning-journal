# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary view' do
  context 'user can access glossary' do
    let(:user) { create(:user) }
    let(:glossary) { create(:glossary) }

    scenario 'displays glossary page for user' do
      term_to_check = glossary.term
      sign_in user
      visit '/glossaries'
      expect(page).to have_content term_to_check
    end
  end
end
