class ClientRevenue < ClientBase
  private

  def url
    Rails.application.config.url_settings.dig(Rails.env, 'client_revenue_url')
  end

  def store_up
    @data_storage_id = DataStorage.create_client_revenue(data_string).id
  end

  def calc_job
    client_revenue_create
    client_revenue_calc
  end

  def client_revenue_create
    ::ClientRevenueCreateJob.set(wait: 1.minute).perform_later(data_storage_id)
  end

  def client_revenue_calc
    ::ClientRevenueCalcJob.set(wait: 1.minute).perform_later
  end
end
