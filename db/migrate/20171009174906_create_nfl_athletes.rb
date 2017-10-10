class CreateNflAthletes < ActiveRecord::Migration[5.1]
  def change
    create_table :nfl_athletes do |t|
    	t.string :name
    	t.string :position
    	t.string :team
    	t.integer :passing_yards, :default => 0
    	t.integer :passing_touchdowns, :default => 0
    	t.integer :rushing_yards, :default => 0
    	t.integer :rushing_touchdowns, :default => 0
    	t.integer :receiving_yards, :default => 0
    	t.integer :receiving_touchdowns, :default => 0
    	t.float :stock_value, :default => 100
    	t.float :fantasy_projection, :default => 0
    	t.float :actual_fantasy_value, :default => 0
    	t.timestamps
    end
  end
end
