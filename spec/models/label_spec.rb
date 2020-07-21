# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  let(:label) { create(:label) }
  let(:label_2) { create(:label) }
  let(:updated_label) do
    create(
      :label,
      name: label.name,
    )
  end

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

  context 'modification' do
    before(:each) do
      Label.create(
        name: label.name
      )
    end

    it 'removes entries from the DB upon deletion' do
      expect { label.delete }.to change(Label, :count).by(-1)
    end

    it 'will only alter the name in the DB when updated in the model' do
      updated_label.update(name: label_2.name)
      expect(updated_label.name).not_to eq(label.name)
      expect(updated_label.name).to eq(label_2.name)
    end
  end
end
