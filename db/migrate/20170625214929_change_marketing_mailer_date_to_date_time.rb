class ChangeMarketingMailerDateToDateTime < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :marketing_mailer_date, :datetime
  end
end
