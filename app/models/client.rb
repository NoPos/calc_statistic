class Client < ApplicationRecord
  self.table_name = 'clients'

  has_one :revenue

  def self.parse_storage(data_storage_id)
    data_string = DataStorage.find_client_info(data_storage_id).data_string
    parsed_clients = JSON.parse(data_string)['data']
    upsert_all(parsed_clients)
  end

  def self.row_with_highest_revenue
    select_revenue(limit: 1, order_by: 'DESC').take
  end

  def self.row_with_lowest_revenue
    select_revenue(limit: 1, order_by: 'ASC').take
  end

  def self.select_top_revenue(limit)
    select_revenue(limit: limit, order_by: 'DESC')
  end

  def ready_attributes
    attributes
      .slice('full_name', 'revenue')
      .symbolize_keys
  end

  private

  def self.select_revenue(limit:, order_by:)
    joins(:revenue)
      .select("clients.client_first_name || ' ' || clients.client_last_name AS full_name, revenues.revenue AS revenue")
      .order("revenue #{order_by}")
      .limit(limit)
  end
end
