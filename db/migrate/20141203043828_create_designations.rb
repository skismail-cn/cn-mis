class CreateDesignations < ActiveRecord::Migration
  def change
    create_table :designations do |t|
      t.string :name
      t.string :department
      t.boolean :status
      t.references :department, index: true

      t.timestamps
    end
  end
end
