class Pass < ApplicationRecord
  belongs_to :activity
  belongs_to :checkpoint, required:false
  has_one :course, through: :activity

  #近くの未登録のチェックポイントを探す
  def find_near_checkpoint distance:0.01
    self.course.checkpoints
        .where(":lat - :distance < lat and lat < :lat + :distance", lat:self.lat, distance:distance)
        .where(":lng - :distance < lng and lng < :lng + :distance", lng:self.lng, distance:distance)
        .where("not exists (select * from passes where passes.checkpoint_id = checkpoints.id and passes.activity_id = :activity_id)", activity_id:self.activity.id)
        .first
  end
end
