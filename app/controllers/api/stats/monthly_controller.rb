module Api
  module Stats
    class MonthlyController < ApiController
      def index
        x = MonthlyService.new
        monthly_stats = x.monthly

        render json: monthly_stats
      end
    end
  end
end
