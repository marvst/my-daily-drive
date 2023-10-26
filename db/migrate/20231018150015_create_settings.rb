class CreateSettings < ActiveRecord::Migration[7.1]
  def change
    create_table :settings do |t|
      t.string :key
      t.string :value
      t.boolean :active
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :settings, :users, column: :user_id
  end
end
