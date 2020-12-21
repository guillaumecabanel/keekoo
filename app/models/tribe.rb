class Tribe < ApplicationRecord
  belongs_to :user

  has_many :moments

  validates :title, presence: true
  validates :title, uniqueness: { scope: :user_id, case_sensitive: false }
end
