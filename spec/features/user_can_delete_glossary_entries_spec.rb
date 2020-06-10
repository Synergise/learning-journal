# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary deletion' do
  context 'user can delete glossary term' do
    let(:user) { create(:user) }
    let(:glossary) { create(:glossary) }

    scenario 'will delete a new glossary entry' do
      sign_in user
      visit "/glossaries/#{glossary.id}"
      click_link 'Delete'
      expect(page).not_to have_content glossary.term
    end
  end
end
