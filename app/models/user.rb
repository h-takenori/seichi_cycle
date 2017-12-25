class User < ApplicationRecord
  devise :omniauthable, :rememberable
  has_many :activities
  has_many :passes, through: :activities
end
