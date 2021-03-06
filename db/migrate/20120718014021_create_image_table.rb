class CreateImageTable < ActiveRecord::Migration
  def up
    create_table :images do |t|
      t.integer :binary_id
      t.string :name
      t.timestamps
    end
  end

  def down
    drop_table :images
  end
end
