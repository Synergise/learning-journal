# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Glossary, type: :mode do
  context "creation" do
    let(:glossaryMock) { build(:glossary) }

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

    it 'adds valid entries to the database' do
      glossary = Glossary.new(
        term: glossaryMock.term, 
        definition: glossaryMock.definition
      )
      expect{ glossary.save }.to change(Glossary, :count).by(1)
    end
  end

  context "modification" do
    it 'removes entries from the database upon deletion' do
      
    end

    it 'updates entries in the database upon valid editing' do
    end
  end

  # check from all angles
  # eg count has gone up/down etc
end
