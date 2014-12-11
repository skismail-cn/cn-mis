class CreateLeavetypes < ActiveRecord::Migration
  def change
    create_table :leavetypes do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
