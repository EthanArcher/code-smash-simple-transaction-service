require 'spec_helper'

describe StatusController do

  describe 'show' do
    before { get :show }

    subject { response.body }

    it 'should return a message indicating the service is available' do
      get :show
      expect(JSON.parse(subject)).to eql({ 'status' => 'Everything is working!' })
    end
  end
end
