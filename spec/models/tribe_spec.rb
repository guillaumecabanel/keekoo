require 'rails_helper'

RSpec.describe Tribe, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:moments) }
    it { should have_many(:memberships) }
  end

  describe 'validations' do
    subject { FactoryBot.build :tribe }

    it { should validate_presence_of :title }
    it { should validate_uniqueness_of(:title).ignoring_case_sensitivity.scoped_to(:user_id) }
  end
end
