class TimestampToDatePaymentsTable < ActiveRecord::Migration
  def up
    change_column :payments, :payment_date, :date
  end

  def down
    change_column :payments, :payment_date, :datetime
  end
end
