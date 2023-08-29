require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "is valid with valid attributes" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to be_valid
    end

    it "is invalid with mismatched password and password_confirmation" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@example.com',
        password: 'passwordd',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "is invalid without a password" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@example.com',
        password: nil,
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "is invalid without an email" do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "is invalid with a duplicate email" do
      User.create(
        first_name: 'Existing',
        last_name: 'User',
        email: 'existing@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      user = User.new(
        first_name: 'New',
        last_name: 'User',
        email: 'EXISTING@example.com',
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("Email has already been taken")
    end

    it "is invalid without first & last name and email" do
      user = User.new(
        first_name: nil,
        last_name: nil,
        email: nil,
        password: 'password',
        password_confirmation: 'password'
      )
      expect(user).to_not be_valid
      expect(user.errors.full_messages).to include("First name can't be blank")
      expect(user.errors.full_messages).to include("Last name can't be blank")
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
  end
end
