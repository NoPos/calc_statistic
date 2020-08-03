class ClientRevenueCalcJob < ApplicationJob
  def perform
    ::Calc::ClientRevenueSummary.execute
  end
end
