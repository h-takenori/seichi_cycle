class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end
