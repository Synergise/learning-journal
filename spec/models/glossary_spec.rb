# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Glossary, type: :mode do
  let(:glossaryMock) { build(:glossary) }
  let(:glossaryMock2) { build(:glossary) }

  context 'creation' do
    it 'will mark an empty glossary instance as invalid' do
      glossary = Glossary.new
      glossary.valid?
      expect(glossary.errors.details[:term]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark entries without a term as invalid' do
      glossary = Glossary.new(definition: glossaryMock.definition)
      glossary.valid?
      expect(glossary.errors.details[:term]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark entries without a definition as invalid' do
      glossary = Glossary.new(term: glossaryMock.term)
      glossary.valid?
      expect(glossary.errors.details[:definition]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'adds valid entries to the DB' do
      glossary = Glossary.new(
        term: glossaryMock.term,
        definition: glossaryMock.definition
      )
      expect { glossary.save }.to change(Glossary, :count).by(1)
    end
  end

  context 'modification' do
    before(:each) do
      @glossary = Glossary.create(
        term: glossaryMock.term, 
        definition: glossaryMock.definition
      )
    end

    it 'removes entries from the DB upon deletion' do
      expect { @glossary.delete }.to change(Glossary, :count).by(-1)
    end

    it 'will only alter the term in the DB when updated in the model' do
      @glossary.update(term: glossaryMock2.term)
      expect(@glossary.term).not_to eq(glossaryMock.term)
      expect(@glossary.term).to eq(glossaryMock2.term)
      expect(@glossary.definition).to eq(glossaryMock.definition)
      expect(@glossary.definition).not_to eq(glossaryMock2.definition)
    end

    it 'will only alter definition in the DB when updated in the model' do
      @glossary.update(definition: glossaryMock2.definition)
      expect(@glossary.term).to eq(glossaryMock.term)
      expect(@glossary.term).not_to eq(glossaryMock2.term)
      expect(@glossary.definition).not_to eq(glossaryMock.definition)
      expect(@glossary.definition).to eq(glossaryMock2.definition)
    end

    it 'updates entries in the DB upon valid editing' do
      @glossary.update(
        term: glossaryMock2.term,
        definition: glossaryMock2.definition
      )
      expect(@glossary.term).not_to eq(glossaryMock.term)
      expect(@glossary.term).to eq(glossaryMock2.term)
      expect(@glossary.definition).not_to eq(glossaryMock.definition)
      expect(@glossary.definition).to eq(glossaryMock2.definition)
    end

    it 'does not change DB count upon successful editing' do
      expect {
        @glossary.update(
          term: glossaryMock2.term,
          definition: glossaryMock2.definition
        )
      }
      .not_to change(Glossary, :count)
    end
  end
end
