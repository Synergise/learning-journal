# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  let!(:user_two) { create(:user) }
  let(:user_three) { build(:user) }
  let(:updated_user) do
    build(
      :user,
      email: user.email,
      password: user.password
    )
  end

  context 'creation' do
    it 'will mark an empty user instance as invalid' do
      empty_user = User.new
      empty_user.valid?
      expect(empty_user.errors.details[:email]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark entries without an email as invalid' do
      no_email_user = User.new(password: user.password)
      no_email_user.valid?
      expect(no_email_user.errors.details[:email]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark an empty password as invalid' do
      no_pw_user = User.new(email: user.email)
      no_pw_user.valid?
      expect(no_pw_user.errors.details[:password]).to include(
        a_hash_including(error: :blank)
      )
    end

    it 'will mark a user with valid credentials as valid' do
      expect(user).to be_valid
    end

    it 'will not allow password confirmation to be different' do
      invalid_user = User.new(
        email: user.email,
        password: user.password,
        password_confirmation: user_three.password
      )
      invalid_user.valid?
      expect(invalid_user.errors.details[:password_confirmation]).to include(
        a_hash_including(error: :confirmation)
      )
    end

    it 'adds valid entries to the DB' do
      valid_user = User.new(
        email: user.email,
        password: user.password
      )
      expect { valid_user.save }.to change(User, :count).by(1)
    end

    it 'should not allow duplicate emails ' do
      user.email = user_two.email
      user.valid?
      expect(user.errors.details[:email]).to include(
        a_hash_including(error: :taken)
      )
    end
  end

  context 'modification' do
    it 'removes entries from the DB upon deletion' do
      expect { user_two.delete }.to change(User, :count).by(-1)
    end

    it 'will not allow altering emails to one already in the db' do
      user.update(email: user_two.email)
      user.valid?
      expect(user.errors.details[:email]).to include(
        a_hash_including(error: :taken)
      )
    end

    it 'will only alter email in DB when validly updated in the model' do
      updated_user.update(email: user_three.email)
      expect(updated_user).to be_valid
      expect(updated_user.email).not_to eq(user.email)
      expect(updated_user.email).to eq(user_three.email)
      expect(updated_user.password).to eq(user.password)
      expect(updated_user.password).not_to eq(user_three.password)
    end

    it 'will not allow updating when password confirmation different' do
      updated_user.update(
        password: user_three.password,
        password_confirmation: user_two.password
      )
      expect(updated_user).not_to be_valid
    end

    it 'will only alter password in DB when validly updated in the model' do
      updated_user.update(
        password: user_three.password,
        password_confirmation: user_three.password
      )
      expect(updated_user).to be_valid
      expect(updated_user.email).to eq(user.email)
      expect(updated_user.email).not_to eq(user_three.email)
      expect(updated_user.password).to eq(user_three.password)
      expect(updated_user.password).not_to eq(user.password)
    end

    it 'updates entries in the DB upon valid editing of both email and pw' do
      updated_user.update(
        email: user_three.email,
        password: user_three.password,
        password_confirmation: user_three.password
      )
      expect(updated_user).to be_valid
      expect(updated_user.email).not_to eq(user.email)
      expect(updated_user.email).to eq(user_three.email)
      expect(updated_user.password).not_to eq(user.password)
      expect(updated_user.password).to eq(user_three.password)
    end

    it 'does not change DB count upon successful editing' do
      expect do
        updated_user.update(
          email: user_three.email,
          password: user_three.password
        )
      end
        .not_to change(User, :count)
    end
  end
end
