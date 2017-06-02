class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :stars
      t.string :director
      t.integer :year

      t.timestamps
    end
  end
end
