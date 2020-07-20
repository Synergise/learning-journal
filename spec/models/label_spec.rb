# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Label, type: :model do
  context 'creation' do
    it 'will mark an empty label instance as invalid' do
      empty_label = Label.new
      empty_label.valid?
      expect(empty_label.errors.details[:name]).to include(
        a_hash_including(error: :blank)
      )
    end


  end
end
