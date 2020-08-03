module Calc
  class ClientRevenueSummary
    class << self
      def execute
        calc_highest_revenue_all_time
        calc_lowest_revenue_all_time
        calc_lowest_revenue_last_event
        calc_total_revenue_last_event
        calc_top_highest_revenue
      end

      def calc_highest_revenue_all_time
        candidate_attrs = Client.row_with_highest_revenue.ready_attributes

        if HighestRevenueAllTime.none?
          HighestRevenueAllTime.create!(candidate_attrs)
        elsif candidate_attrs[:revenue] >= HighestRevenueAllTime.single_row.revenue
          HighestRevenueAllTime.single_row.update!(candidate_attrs)
        end
      end

      def calc_lowest_revenue_all_time
        candidate_attrs = Client.row_with_lowest_revenue.ready_attributes

        if LowestRevenueAllTime.none?
          LowestRevenueAllTime.create!(candidate_attrs)
        elsif candidate_attrs[:revenue] <= LowestRevenueAllTime.single_row.revenue
          LowestRevenueAllTime.single_row.update!(candidate_attrs)
        end
      end

      def calc_lowest_revenue_last_event
        candidate_attrs = Client.row_with_lowest_revenue.ready_attributes

        if LowestRevenueLastEvent.none?
          LowestRevenueLastEvent.create!(candidate_attrs)
        else
          LowestRevenueLastEvent.single_row.update!(candidate_attrs)
        end
      end

      def calc_total_revenue_last_event
        candidate_attrs = Revenue.total_revenue.ready_attributes

        if TotalRevenueLastEvent.none?
          TotalRevenueLastEvent.create!(candidate_attrs)
        else
          TotalRevenueLastEvent.single_row.update!(candidate_attrs)
        end
      end

      def calc_top_highest_revenue
        top_clients = Client.select_top_revenue(15)

        TopHighestRevenue.transaction do
          TopHighestRevenue.delete_all

          top_clients_attributes = top_clients.map do |client|
            client.attributes.slice('full_name', 'revenue')
          end

          TopHighestRevenue.insert_all(top_clients_attributes)
        end
      end
    end
  end
end
