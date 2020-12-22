class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :tribes, dependent: :destroy
  has_many :moments
  has_many :comments
  has_many :memberships

  validates :nickname, presence: true

  def joined_tribes
    Tribe.includes(:memberships).where(memberships: { user_id: id })
  end
end
