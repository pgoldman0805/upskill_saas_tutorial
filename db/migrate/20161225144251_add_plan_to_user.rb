class AddPlanToUser < ActiveRecord::Migration[5.0]
  def change
    
    # This will add a column to the 'users' table called plan_id
    # which will be either 1 or 2 (basic or pro)
    
    add_column :users, :plan_id, :integer 
  end
end
