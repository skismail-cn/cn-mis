class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.timestamp :payment_date
      t.decimal :payment_amount, precision: 12, scale: 2
      t.text :payment_desc
      t.references :project, index: true

      t.timestamps
    end
  end
end
