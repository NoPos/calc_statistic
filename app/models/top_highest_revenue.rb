class TopHighestRevenue < ApplicationRecord
  self.table_name = 'top_highest_revenue'

  def self.cached_all
    Rails.cache.fetch(self.to_s.underscore, expires_in: cache_expires_in) do
      all.to_a
    end
  end

  private
  # could me moved to config
  def self.cache_expires_in
    5.minutes
  end
end
