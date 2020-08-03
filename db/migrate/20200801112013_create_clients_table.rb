class CreateClientsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :clients, { primary_key: 'client_id' } do |t|
      t.string :client_first_name
      t.string :client_last_name
      t.datetime :updated_at
    end
  end
end
