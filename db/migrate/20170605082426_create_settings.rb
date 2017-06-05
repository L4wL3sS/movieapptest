class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.references :user, foreign_key: true
      t.string :country
      t.string :language

      t.timestamps
    end
  end
end
