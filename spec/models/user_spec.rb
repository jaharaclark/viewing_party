require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it { should have_secure_password }
  end

  describe 'relationships' do
    it { should have_many(:user_friends) }
    it { should have_many(:friends).through(:user_friends) }
    # it { should have_many(:parties) }
  end
end
