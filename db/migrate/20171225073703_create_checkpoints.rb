class CreateCheckpoints < ActiveRecord::Migration[5.1]
  def change
    create_table :checkpoints do |t|
      t.references :course
      t.string :name
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
