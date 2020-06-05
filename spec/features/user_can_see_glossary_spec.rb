# frozen_string_literal: true

require 'rails_helper'
require 'sign_up_helper'

feature 'Glossary view' do
  context 'user can access glossary' do
    let(:user) { build(:user) }

    scenario 'displays glossary page for user' do
      sign_up(user)
      click_link 'Glossary'
      expect(current_path).to eq '/glossaries'
    end
  end
end
