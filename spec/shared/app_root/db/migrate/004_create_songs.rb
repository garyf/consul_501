class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.boolean :trashed
      t.timestamps
    end
  end
end
