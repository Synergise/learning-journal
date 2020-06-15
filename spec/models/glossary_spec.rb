# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Glossary, type: :mode do
  it 'will mark an empty glossary instance as invalid' do
    glossary = Glossary.new
    glossary.valid?
    expect(glossary.errors.details[:term]).to include(
      a_hash_including(error: :blank)
    )
  end

  it 'will mark entries without a term as invalid' do
  end

  it 'will mark entries without a definition as invalid' do
  end

  it 'adds valid entries to the database' do
  end

  it 'removes entries from the database upon deletion' do
  end

  it 'updates entries in the database upon valid editing' do
  end

  # check from all angles
  # eg count has gone up/down etc
end
