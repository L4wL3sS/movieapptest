class AddUrlToPeliculas < ActiveRecord::Migration[5.0]
  def change
    add_column :movies, :url, :text
  end
end
