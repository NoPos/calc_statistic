class Revenue < ApplicationRecord
  self.table_name = 'revenues'
  belongs_to :client

  def self.parse_storage(data_storage_id)
    data_string = ::DataStorage.find_client_revenue(data_storage_id).data_string
    parsed_revenues = JSON.parse(data_string)['data']
    upsert_all(parsed_revenues, unique_by: :index_revenues_on_client_id)
  end

  def self.total_revenue
    select("SUM(revenue) as revenue").take
  end

  def ready_attributes
    attributes
      .slice('revenue')
      .symbolize_keys
  end
end
