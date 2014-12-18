class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.string :client_name
      t.string :client_email
      t.string :bdm_name
      t.timestamp :start_date
      t.timestamp :end_date
      t.decimal :project_cost, precision: 12, scale: 2
      t.string :team_members
      t.references :projectstatus, index: true
      t.references :projecttype, index: true
      t.references :projectmode, index: true
      t.references :member, index: true
      t.references :depratment, index: true
      t.references :location, index: true

      t.timestamps
    end
  end
end
