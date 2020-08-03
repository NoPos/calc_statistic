class AddStatisticsTables < ActiveRecord::Migration[6.0]
  def change
    create_table :highest_revenue_all_time do |t|
      t.string :full_name
      t.integer :revenue
      t.datetime :updated_at
    end

    create_table :lowest_revenue_all_time do |t|
      t.string :full_name
      t.integer :revenue
      t.datetime :updated_at
    end

    create_table :lowest_revenue_last_event do |t|
      t.string :full_name
      t.integer :revenue
      t.datetime :updated_at
    end

    create_table :total_revenue_last_event do |t|
      t.integer :revenue
      t.datetime :updated_at
    end

    create_table :top_highest_revenue do |t|
      t.string :full_name
      t.integer :revenue
    end
  end
end
