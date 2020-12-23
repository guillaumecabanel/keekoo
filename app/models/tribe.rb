class Tribe < ApplicationRecord
  belongs_to :user

  has_many :moments
  has_many :memberships
  has_many :users, through: :memberships

  validates :title, presence: true
  validates :title, uniqueness: { scope: :user_id, case_sensitive: false }

  after_create :set_uuid, :create_membership

  def set_uuid
    update(uuid: "#{id}-#{SecureRandom.alphanumeric(8)}")
  end

  def create_membership
    Membership.create(
      user_id: user_id,
      tribe_id: id
    )
  end
end
