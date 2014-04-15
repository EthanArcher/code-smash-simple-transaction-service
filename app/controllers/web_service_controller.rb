class WebServiceController < ApplicationController
  # Our web service controllers only offer JSON response bodies
  respond_to :json
end
