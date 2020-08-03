class ClientInfo < ClientBase
  private

  def store_up
    @data_storage_id = DataStorage.create_client_info(data_string).id
  end

  def url
    Rails.application.config.url_settings.dig(Rails.env, 'client_info_url')
  end

  def calc_job
    ::ClientInfoCreateJob.set(wait: 1.minute).perform_later(data_storage_id)
  end
end
