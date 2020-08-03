class ClientRevenueCreateJob < ApplicationJob
  def perform(data_storage_id)
    Revenue.parse_storage(data_storage_id)
  end
end
