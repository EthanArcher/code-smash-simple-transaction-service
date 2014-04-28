class SalesController < WebServiceController

  def index
    sales = []
    render json: sales
  end

  def show
    # Hint: look at the 'params' hash
  end

  def create
    # Hint: check if your newly created sale is valid
    #       by checking sale.valid? and looking at the
    #       errors array
  end

end
