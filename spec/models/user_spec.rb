require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:tribes) }
  end

  describe 'validations' do
    subject { FactoryBot.build :user }

    it { should validate_presence_of :email }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

    it { should validate_presence_of :nickname }
  end
end
