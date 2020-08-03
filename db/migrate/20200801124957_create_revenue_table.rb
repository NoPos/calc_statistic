class CreateRevenueTable < ActiveRecord::Migration[6.0]
  def change
    create_table :revenues do |t|
      t.references :client, index: {unique: true}
      t.integer :revenue
      t.datetime :updated_at
    end
  end
end
