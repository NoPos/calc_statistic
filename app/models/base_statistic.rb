class BaseStatistic < ApplicationRecord
  def self.single_row
    take
  end

  def self.cached_single_row
    Rails.cache.fetch(self.to_s.underscore, expires_in: cache_expires_in) do
      single_row
    end
  end

  private

  # could me moved to config
  def self.cache_expires_in
    5.minutes
  end
end
