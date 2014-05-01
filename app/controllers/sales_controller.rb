class SalesController < WebServiceController

  def index
    sales = Sale.all?  #sales set to contain all sales
    render json: sales #render sales
    
  end

  def show
    render json: Sale.find(params['id']) # sale can be found using its id parameter
    # Hint: look at the 'params' hash
    
  end

  def create
    
    sale = Sale.new   #new sale created 
    sale.items = params['sale']['items'] #item parameters set
    sale['total'] = 0 #total set to zero
    

    sale['items'].each do |item|  #for each sale item
      sale['total'] += item['price'].to_f #total = total + price of item

      if item.key? 'discount' #if the key cointains discount the item is discounted
        sale['total'] -= item['discount']['amount'].to_f #therefore reduce total by the discounted amount
      end
    end

    sale.valid? #check if the sale is valid
    sale.save #save the sale
    render json: sale #render the sale

    # Hint: check if your newly created sale is valid
    #       by checking sale.valid? and looking at the
    #       errors array

  end
end