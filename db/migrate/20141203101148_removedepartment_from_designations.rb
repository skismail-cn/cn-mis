class RemovedepartmentFromDesignations < ActiveRecord::Migration
  def change
  	remove_column :designations, :department, :string
  end
end
