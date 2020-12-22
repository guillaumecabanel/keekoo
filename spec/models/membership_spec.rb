require 'rails_helper'

RSpec.describe Membership, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:tribe) }
  end

  describe 'validations' do
    subject { FactoryBot.build :membership }

    it { should validate_uniqueness_of(:tribe_id).scoped_to(:user_id) }
  end
end
