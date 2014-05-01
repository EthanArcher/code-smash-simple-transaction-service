class ReportsController < WebServiceController

  def total_sales
  	sales = Sale.all

  	report = { 'number_of_sales' => 0 , 'total' => 0}

  	sales.each do |sale|
  		report['number_of_sales'] += 1
  		report['total'] += sale['total'].to_f

  	end

  	render json: report

  end

  def sales_per_item

  	finalReport = {}
  	sales = Sale.all
  	names = Array.new

  	sales.each do |sale|
  		sale['items'].each do |item|
  				name = item['name']
  				unless finalReport.key? name
  						finalReport[name] = { 'number_of_sales' => 0 , 'total' => 0 }
  				end
  				finalReport[name]['number_of_sales'] +=1 
  				finalReport[name]['total'] += item['price']

  				if item.key? 'discount'
  					finalReport[name]['total'] -= item['discount']['amount'].to_f
  				end

  		end
  	end

  	render json: finalReport
  end

end
