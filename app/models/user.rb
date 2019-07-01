class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  has_many :story_comments, dependent: :destroy
  has_many :stories, dependent: :destroy

  attachment :profile_image

  validates :name, length: { in: 2..20 }
end
