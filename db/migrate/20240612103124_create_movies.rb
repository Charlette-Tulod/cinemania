class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :duration
      t.text :description
      t.string :genre
      t.float :ratings
      t.string :director

      t.timestamps
    end
  end
end
