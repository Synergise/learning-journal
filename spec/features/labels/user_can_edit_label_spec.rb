# frozen_string_literal: true

require 'rails_helper'

feature 'Label updating' do
  context 'user can edit labels' do
    let(:user) { create(:user) }
    let!(:label) { create(:label) }
    let(:label2) { build(:label) }

    scenario 'with valid inputs will update a new label' do
      sign_in user
      visit label_path(label)
      edit_label(label2.name)
      expect(page).not_to have_content label.name
      expect(page).to have_content label2.name
    end
  end
end
