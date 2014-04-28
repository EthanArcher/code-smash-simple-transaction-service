class ReceiptsController < WebServiceController

  def show
    receipt = {}
    render json: receipt
  end

end
