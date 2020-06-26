# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_mock) { build(:user) }

  context "creation" do
    it 'will mark an empty user instance as invalid' do
      user = User.new
      user.valid?
      expect(user.errors.details[:email]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark entries without an email as invalid' do
      user = User.new(password: user_mock.password)
      user.valid?
      expect(user.errors.details[:email]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark an empty password as invalid' do
      user = User.new(email: user_mock.email)
      user.valid?
      expect(user.errors.details[:password]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark a user with valid credentials as valid' do
      user = User.new(
        email: user_mock.email,
        password: user_mock.password
      )
      expect(user.valid?).to eq(true)
    end

    it 'adds valid entries to the DB' do
      user = User.new(
        email: user_mock.email,
        password: user_mock.password
      )
      expect { user.save }.to change(User, :count).by(1)
    end

    it 'should not allow duplicate emails ' do
      user = User.new(email: user_mock.email, password: user_mock.password)
      user.save
      user2 = User.new(email: user_mock.email, password: user_mock.password)
      user2.valid?
      expect(user2.errors.details[:email]).to include(
        a_hash_including(error: :taken)
      )
    end
  end
end
