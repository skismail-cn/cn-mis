class FixColumnName < ActiveRecord::Migration
	def change
		change_table :members do |t|
			t.rename :Password, :salt
			t.rename :Confirm_Password, :encrypted_password
		end
	end
end
