# frozen_string_literal: true

require 'rails_helper'

feature 'Glossary view' do
  context 'user can access glossary' do
    let(:user) { create(:user) }
    let!(:glossary) { create(:glossary) }

    scenario 'displays glossary page for user' do
      sign_in user
      visit glossaries_path
      expect(page).to have_content glossary.term
    end
  end
end
