class CreatePasses < ActiveRecord::Migration[5.1]
  def change
    create_table :passes do |t|
      t.references :activity
      t.references :checkpoint, null:true
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
