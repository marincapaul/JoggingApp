class CreateRuns < ActiveRecord::Migration[7.0]
  def change
    create_table :runs do |t|
      t.float :distance
      t.integer :time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :runs, [:user_id, :created_at]
  end
end
