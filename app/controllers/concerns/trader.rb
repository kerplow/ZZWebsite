module Trader
  extend ActiveSupport::Concern

  included do
    before_action :check_tradeable

    def get_model(model)
      params[:tradeable] == 'tradeable' ? model.tradeable(model_params) : model.new(model_params)
    end

    def model_params
      params.permit()
    end
  end
end
