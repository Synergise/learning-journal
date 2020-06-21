# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Glossary, type: :model do
  let(:glossary_mock) { create(:glossary) }
  let(:glossary_mock2) { build(:glossary) }
  let(:updated_glossary) do
    create(
      :glossary,
      term: glossary_mock.term,
      definition: glossary_mock.definition
    )
  end

  context 'creation' do
    it 'will mark an empty glossary instance as invalid' do
      glossary = Glossary.new
      glossary.valid?
      expect(glossary.errors.details[:term]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark entries without a term as invalid' do
      glossary = Glossary.new(definition: glossary_mock.definition)
      glossary.valid?
      expect(glossary.errors.details[:term]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark entries without a definition as invalid' do
      glossary = Glossary.new(term: glossary_mock.term)
      glossary.valid?
      expect(glossary.errors.details[:definition]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark entries with valid credentialss as valid' do
      glossary = Glossary.new(
        term: glossary_mock.term,
        definition: glossary_mock.definition
      )
      expect(glossary.valid?).to eq(true)
    end

    it 'adds valid entries to the DB' do
      glossary = Glossary.new(
        term: glossary_mock.term,
        definition: glossary_mock.definition
      )
      expect { glossary.save }.to change(Glossary, :count).by(1)
    end
  end

  context 'modification' do
    before(:each) do
      Glossary.create(
        term: glossary_mock.term,
        definition: glossary_mock.definition
      )
    end

    it 'removes entries from the DB upon deletion' do
      expect { glossary_mock.delete }.to change(Glossary, :count).by(-1)
    end

    it 'will only alter the term in the DB when updated in the model' do
      updated_glossary.update(term: glossary_mock2.term)
      expect(updated_glossary.term).not_to eq(glossary_mock.term)
      expect(updated_glossary.term).to eq(glossary_mock2.term)
      expect(updated_glossary.definition).to eq(glossary_mock.definition)
      expect(updated_glossary.definition).not_to eq(glossary_mock2.definition)
    end

    it 'will only alter definition in the DB when updated in the model' do
      updated_glossary.update(definition: glossary_mock2.definition)
      expect(updated_glossary.term).to eq(glossary_mock.term)
      expect(updated_glossary.term).not_to eq(glossary_mock2.term)
      expect(updated_glossary.definition).not_to eq(glossary_mock.definition)
      expect(updated_glossary.definition).to eq(glossary_mock2.definition)
    end

    it 'updates entries in the DB upon valid editing' do
      updated_glossary.update(
        term: glossary_mock2.term,
        definition: glossary_mock2.definition
      )
      expect(updated_glossary.term).not_to eq(glossary_mock.term)
      expect(updated_glossary.term).to eq(glossary_mock2.term)
      expect(updated_glossary.definition).not_to eq(glossary_mock.definition)
      expect(updated_glossary.definition).to eq(glossary_mock2.definition)
    end

    it 'does not change DB count upon successful editing' do
      expect do
        glossary_mock.update(
          term: glossary_mock.term,
          definition: glossary_mock.definition
        )
      end
        .not_to change(Glossary, :count)
    end
  end
end
