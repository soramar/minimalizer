class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name
      t.datetime :purchase_date
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
