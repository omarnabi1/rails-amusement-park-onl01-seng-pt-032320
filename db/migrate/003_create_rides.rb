class CreateRides < ActiveRecord::Migration[5.1]
    def change
        create_table :rides do |t|
          t.string :name
          t.integer :user_id
          t.integer :attraction_id
          
        end
    end
end
