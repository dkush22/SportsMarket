class AddWeeksToNflAthletes < ActiveRecord::Migration[5.1]
  def change
    add_column :nfl_athletes, :week_one, :float, default: 0.0
    add_column :nfl_athletes, :week_two, :float, default: 0.0
    add_column :nfl_athletes, :week_three, :float, default: 0.0
    add_column :nfl_athletes, :week_four, :float, default: 0.0
    add_column :nfl_athletes, :week_five, :float, default: 0.0
    add_column :nfl_athletes, :week_six, :float, default: 0.0
    add_column :nfl_athletes, :week_seven, :float, default: 0.0
    add_column :nfl_athletes, :week_eight, :float, default: 0.0
    add_column :nfl_athletes, :week_nine, :float, default: 0.0
    add_column :nfl_athletes, :week_ten, :float, default: 0.0
    add_column :nfl_athletes, :week_eleven, :float, default: 0.0
    add_column :nfl_athletes, :week_twelve, :float, default: 0.0
    add_column :nfl_athletes, :week_thirteen, :float, default: 0.0
    add_column :nfl_athletes, :week_fourteen, :float, default: 0.0
    add_column :nfl_athletes, :week_fifteen, :float, default: 0.0
    add_column :nfl_athletes, :week_sixteen, :float, default: 0.0
    add_column :nfl_athletes, :week_seventeen, :float, default: 0.0
  end
end