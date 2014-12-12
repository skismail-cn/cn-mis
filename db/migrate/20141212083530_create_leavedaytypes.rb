class CreateLeavedaytypes < ActiveRecord::Migration
  def change
    create_table :leavedaytypes do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
