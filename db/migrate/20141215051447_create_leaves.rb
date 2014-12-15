class CreateLeaves < ActiveRecord::Migration
  def change
    create_table :leaves do |t|
      t.integer :contact_number
      t.integer :reporting_to
      t.date :leave_start_date
      t.date :leave_end_date
      t.text :reason_for_leave
      t.text :comments
      t.references :member, index: true
      t.references :leavetype, index: true
      t.references :leavedaytype, index: true
      t.references :leavestatus, index: true

      t.timestamps
    end
  end
end
