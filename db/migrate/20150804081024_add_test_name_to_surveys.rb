class AddTestNameToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :test_name, :string
  end
end
