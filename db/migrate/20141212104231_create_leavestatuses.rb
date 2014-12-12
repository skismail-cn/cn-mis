class CreateLeavestatuses < ActiveRecord::Migration
  def change
    create_table :leavestatuses do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
