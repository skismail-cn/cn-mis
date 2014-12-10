class FixColumnName < ActiveRecord::Migration
	def change
		change_table :members do |t|
			t.rename :Password, :salt
			t.rename :Confirm_Password, :encrypted_password
			t.rename :Hot_Skills, :hot_Skills
		end
	end
end
