class Course < ApplicationRecord
  has_many :checkpoints

  # 近いチェックポイントを探す
  # max_distance 最大距離
  def find_by_coods(pass, max_distance)
    course.check_points.where("6371 * ACOS(
      COS(RADIANS(:lat)) * COS(RADIANS(a.LATITUDE)) * COS(RADIANS(a.LONGITUDE) - RADIANS(:lmg))
       + SIN(RADIANS(:lat)) * SIN(RADIANS(a.LATITUDE)) ")
  end

end
