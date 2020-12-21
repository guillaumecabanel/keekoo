require 'rails_helper'

RSpec.describe Moment, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:tribe) }
    it { should have_many(:comments) }
  end
end
