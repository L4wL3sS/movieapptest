class AddColumsToUser < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :marketing_mailer, :integer
  	add_column :users, :marketing_mailer_date, :date
  end
end
