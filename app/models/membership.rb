class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :tribe

  validates :tribe_id, uniqueness: { scope: :user_id }
end
