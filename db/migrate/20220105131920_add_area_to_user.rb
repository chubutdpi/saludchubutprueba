class AddAreaToUser < ActiveRecord::Migration[5.2]
	def change
    	add_column :users, :area, :string
  	end
end
