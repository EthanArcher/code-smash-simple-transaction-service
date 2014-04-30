class SalesController < WebServiceController

  def index
    sales = Sale.all
    render json: sales
  end

  def show
    render json: Sale.find(params["id"])
    # Hint: look at the 'params' hash
  end

  def create
    sale = Sale.new
    sale.items = params["sale"]["items"]
    total = sale.items.collect { |item| item[:price.to_s].to_f }.reduce(:+)
    sale.total = total
    sale.valid?
    sale.save
    render json: sale
    

    # Hint: check if your newly created sale is valid
    #       by checking sale.valid? and looking at the
    #       errors array
  end

end