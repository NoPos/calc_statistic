class DataStorage < ApplicationRecord
  self.table_name = 'data_storage'

  module CONST
    CLIENT_INFO = 'client_info'.freeze
    CLIENT_REVENUE = 'client_revenue'.freeze
    DATA_TYPE_LIST = [CLIENT_INFO, CLIENT_REVENUE].freeze

    freeze
  end

  validates_inclusion_of :data_type, in: CONST::DATA_TYPE_LIST

  def self.create_client_info(data_string)
    create(data_type: CONST::CLIENT_INFO, data_string: data_string)
  end

  def self.create_client_revenue(data_string)
    create(data_type: CONST::CLIENT_REVENUE, data_string: data_string)
  end

  def self.find_client_info(data_storage_id)
    find_by(id: data_storage_id, data_type: CONST::CLIENT_INFO)
  end

  def self.find_client_revenue(data_storage_id)
    find_by(id: data_storage_id, data_type: CONST::CLIENT_REVENUE)
  end
end
