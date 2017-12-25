class Checkpoint < ApplicationRecord
  belongs_to :course

  # def self.find_with_distance lat, lng, distance:0.01
  #   Checkpoint
  #       .where(":lat - :distance < lat and lat < :lat + :distance", lat:lat, distance:distance)
  #       .where(":lng - :distance < lng and lng < :lng + :distance", lng:lng, distance:distance)
  # end
end
