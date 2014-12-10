class FixColumnName2 < ActiveRecord::Migration
  def change
  	change_table :members do |t|
		t.rename :Hot_Skills, :hot_Skills
	end
  end
end
