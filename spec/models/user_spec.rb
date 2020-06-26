# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user_mock) { build(:user) }
  let!(:user_mock2) { create(:user) }
  let(:updated_user) do
    create(
      :user,
      email: user_mock.email,
      password: user_mock.password
    )
  end

  context 'creation' do
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

  context 'modification' do
    it 'removes entries from the DB upon deletion' do
      expect { user_mock2.delete }.to change(User, :count).by(-1)
    end

    it 'will only alter the email in the DB when updated in the model' do
      updated_user.update(email: user_mock2.email)
      expect(updated_user.email).not_to eq(user_mock.email)
      expect(updated_user.email).to eq(user_mock2.email)
      expect(updated_user.password).to eq(user_mock.password)
      expect(updated_user.password).not_to eq(user_mock2.password)
    end

    it 'will only alter the password in the DB when updated in the model' do
      updated_user.update(password: user_mock2.password)
      expect(updated_user.email).to eq(user_mock.email)
      expect(updated_user.email).not_to eq(user_mock2.email)
      expect(updated_user.password).not_to eq(user_mock.password)
      expect(updated_user.password).to eq(user_mock2.password)
    end

    it 'updates entries in the DB upon valid editing' do
      updated_user.update(
        email: user_mock2.email,
        password: user_mock2.password
      )
      expect(updated_user.email).not_to eq(user_mock.email)
      expect(updated_user.email).to eq(user_mock2.email)
      expect(updated_user.password).not_to eq(user_mock.password)
      expect(updated_user.password).to eq(user_mock2.password)
    end

    it 'does not change DB count upon successful editing' do
      expect do
        user_mock2.update(
          email: user_mock.email,
          password: user_mock.password
        )
      end
        .not_to change(User, :count)
    end
  end
end
