class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.string    :title, null: false
      t.references :artist, foreign_key: true
      t.timestamps
    end
  end
end
