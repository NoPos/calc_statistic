class CreateDataStorageTable < ActiveRecord::Migration[6.0]
  def change
    create_table :data_storage do |t|
      t.string :data_type
      t.text :data_string, limit: 500_000_000
      t.datetime :created_at, null: false
    end
  end
end
