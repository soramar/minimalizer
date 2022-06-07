class RemoveUserFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :user_id, :bigint
  end
end
