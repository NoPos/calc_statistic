class SummaryPageController < ApplicationController
  def show
    @highest_revenue_all_time = HighestRevenueAllTime.cached_single_row
    @lowest_revenue_all_time = LowestRevenueAllTime.cached_single_row
    @lowest_revenue_last_event = LowestRevenueLastEvent.cached_single_row
    @total_revenue_last_event = TotalRevenueLastEvent.cached_single_row

    @top_highest_revenue = TopHighestRevenue.cached_all

    render plain: 'Wait until data synchronization' unless @highest_revenue_all_time && @lowest_revenue_all_time &&
                                                           @lowest_revenue_last_event && @total_revenue_last_event &&
                                                           @top_highest_revenue
  end
end
