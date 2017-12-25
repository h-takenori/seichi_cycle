class AddIsActiveToActivity < ActiveRecord::Migration[5.1]
  def change
    add_column :activities, :is_active, :boolean, default:false, null:false
  end
end
