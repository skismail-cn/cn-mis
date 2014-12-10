class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :Name
      t.string :Email
      t.date :Joining_Date
      t.date :Confirmation_Date
      t.string :hot_Skills
      t.decimal :Salary, precision: 10, scale: 2
      t.integer :Reporting_To
      t.integer :Earned_Leave, limit: 2
      t.integer :Casual_Leave, limit: 2
      t.integer :Sick_Leave, limit: 2
      t.string :salt
      t.string :encrypted_password
      t.references :designation, index: true
      t.references :department, index: true
      t.references :location, index: true

      t.timestamps
    end
  end
  def up
    change_table :members do |t|
      t.rename :Password, :salt
      t.rename :Confirm_Password, :encrypted_password
      t.rename :Hot_Skills, :hot_Skills
    end
  end
end
