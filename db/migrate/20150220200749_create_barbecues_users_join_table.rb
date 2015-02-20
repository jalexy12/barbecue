class CreateBarbecuesUsersJoinTable < ActiveRecord::Migration
  def change
    create_join_table :barbecues, :users do |t|
      t.index [:barbecue_id, :user_id]
      t.index [:user_id, :barbecue_id]
    end
  end
end
