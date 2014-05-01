class ReportsController < WebServiceController

  def total_sales
  	sales = Sale.all #sales set to all sales

  	report = { 'number_of_sales' => 0 , 'total' => 0} #report contails number of sales and total both initiased as zero

  	sales.each do |sale| 	#for each sale
  		report['number_of_sales'] += 1 	#increment the number of sales by 1
  		report['total'] += sale['total'].to_f #increase the total by the total price of that sale

  	end

  	render json: report #render the report

  end

  def sales_per_item

  	finalReport = {} #initalise the finalReport empty
  	sales = Sale.all #sales set to all sales

  	sales.each do |sale| #for each sale
  		sale['items'].each do |item| #for each item of each sale
  				name = item['name'] #variable name holds the name of the item
  				unless finalReport.key? name #if the name is not already included
  						finalReport[name] = { 'number_of_sales' => 0 , 'total' => 0 } #create the item name and set number of sales to zero and total to zero
  				end
  				finalReport[name]['number_of_sales'] +=1 #increment the sales of the item with that name
  				finalReport[name]['total'] += item['price'] #increment the total by the price of that item

  				if item.key? 'discount'	#check if the item has been discounted
  					finalReport[name]['total'] -= item['discount']['amount'].to_f #if so reduce the price by the amount of the discount
  				end
  		end
  	end

  	render json: finalReport #render the finalReport

  end

end
