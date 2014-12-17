class CreateProjectmodes < ActiveRecord::Migration
  def change
    create_table :projectmodes do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
