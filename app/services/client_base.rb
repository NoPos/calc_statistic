require 'Net/Http'

class ClientBase
  attr_reader :uri, :net, :data_string, :data_storage_id

  def initialize
    @uri = URI.parse(url)
    @net = Net::HTTP.new(uri.host, uri.port)
    @net.use_ssl = true
  end

  def execute
    make_request
    store_up
    calc_job
  end

  private

  def make_request
    request = Net::HTTP::Get.new uri
    response = net.start.request request
    @data_string = response.body
  end

  def store_up
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def url
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def calc_job
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
