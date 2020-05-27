# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :mode do
  # TODO: Flesh these out

  it 'will mark an empty user instance as invalid' do
    expect(User.new).to_not be_valid
  end
end