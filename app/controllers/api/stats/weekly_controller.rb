module Api
  module Stats
    class WeeklyController < ApiController
      def index
        x = WeeklyService.new
        weekly_stats = x.weekly

        render json: weekly_stats
      end
    end
  end
end
