class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :Name
      t.string :Email
      t.date :Joining_Date
      t.date :Confirmation_Date
      t.string :Hot_Skills
      t.decimal :Salary, precision: 10, scale: 2
      t.integer :Reporting_To
      t.integer :Earned_Leave, limit: 2
      t.integer :Casual_Leave, limit: 2
      t.integer :Sick_Leave, limit: 2
      t.string :Password
      t.string :Confirm_Password
      t.references :designation, index: true
      t.references :department, index: true
      t.references :location, index: true

      t.timestamps
    end
  end
end
