module Trader
  extend ActiveSupport::Concern

  included do

    def get_model(model)
      params[:tradeable] == 'tradeable' ? model.tradeable(model_params) : model.new(model_params)
    end

    def pricetag_params
      params.require(:pricetag).permit!
    end
  end
end
