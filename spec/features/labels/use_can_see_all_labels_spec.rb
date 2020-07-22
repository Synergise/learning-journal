# frozen_string_literal: true

require 'rails_helper'

feature 'Label ' do
  context 'user can see all labels' do
    let(:user) { create(:user) }
    let!(:label) { create(:label) }
    let!(:label2) { create(:label) }

    scenario 'with valid inputs will save a new label' do
      sign_in user
      visit labels_path
      expect(page).to have_content label.name
      expect(page).to have_content label2.name
    end
  end
end
