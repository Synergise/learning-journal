# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  let(:label) { create(:label) }

  context 'creation' do
    it 'will mark an empty label instance as invalid' do
      empty_label = Label.new
      empty_label.valid?
      expect(empty_label.errors.details[:name]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark a label with valid name as valid' do
      expect(label).to be_valid
    end
    
    it 'adds valid entries to the DB' do
      valid_label = Label.new(
        name: label.name
      )
      expect { valid_label.save }.to change(Label, :count).by(1)
    end


  end
end
