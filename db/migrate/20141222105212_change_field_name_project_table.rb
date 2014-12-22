class ChangeFieldNameProjectTable < ActiveRecord::Migration
  def self.up
    rename_column :projects, :depratment_id, :department_id
  end

  def self.down
    rename_column :projects, :department_id,:depratment_id
  end
end
