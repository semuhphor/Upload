class CreateBinaryTable < ActiveRecord::Migration
  def up
    create_table :binaries do |t|
      t.string :name
      t.string :mime_type
      t.string :extension
      t.integer :size
      t.string :path
      t.string :uri
      t.timestamps
    end
  end

  def down
    drop_table :binaries
  end
end
