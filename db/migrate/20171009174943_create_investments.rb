class CreateInvestments < ActiveRecord::Migration[5.1]
  def change
    create_table :investments do |t|
    	t.integer :user_id
    	t.integer :nfl_athlete_id
    	t.integer :quantity
    	t.float :acquisition_price
      t.timestamps
    end
  end
end
