# frozen_string_literal: true

require 'rails_helper'

feature 'Label deletion' do
  context 'user can delete label' do
    let(:user) { create(:user) }
    let!(:label) { create(:label) }

    scenario 'will delete a new label' do
      sign_in user
      visit label_path(label)
      click_link 'Delete'
      expect(page).to have_content 'Label term successfully deleted.'
    end
  end
end
