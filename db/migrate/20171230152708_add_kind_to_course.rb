class AddKindToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :kind, :integer, default:10
  end
end
