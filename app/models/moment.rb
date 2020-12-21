class Moment < ApplicationRecord
  belongs_to :user
  belongs_to :tribe

  has_many :comments

  has_one_attached :picture
end
