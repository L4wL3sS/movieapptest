class AddColumsToPayment < ActiveRecord::Migration[5.0]
  def change
  	add_column :payments, :subscription, :boolean
  	add_column :payments, :channel, :string
  	add_column :payments, :active, :integer
  	add_column :payments, :plan, :boolean
  	add_column :payments, :amount, :bigint
  end
end
