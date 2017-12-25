class User < ApplicationRecord
  devise :omniauthable, :rememberable
end
