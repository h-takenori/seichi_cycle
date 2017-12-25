class User < ApplicationRecord
  devise :omniauthable, :rememberable
  has_many :activities
end
