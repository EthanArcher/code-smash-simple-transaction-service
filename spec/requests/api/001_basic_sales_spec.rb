require 'spec_helper'

describe 'Sales API - Basic Transactions' do

  describe 'index' do
    context 'without sales in the database' do
      before { get '/sales' }

      it { expect(response).to be_success }

      it 'should return an empty set of sales' do
        expect(json).to eql([])
      end
    end

    context 'with sales in the database' do
      let(:first_sale) {
        Sale.create!(
          total: 6.00,
          items: [
            { name: 'soft drink', amount: 1.50 },
            { name: 'burger', amount: 4.50 }
          ]
        )
      }

      let(:second_sale) {
        Sale.create!(
          total: 9.00,
          items: [
            { name: 'milkshake', amount: 2.50 },
            { name: 'burger', amount: 4.50 },
            { name: 'chips', amount: 2.00 }
          ]
        )
      }

      let!(:expected_sales_array) {
        [
          {
            'id' => first_sale.id,
            'items' => [
              { 'name' => 'soft drink', 'amount' => 1.50 },
              { 'name' => 'burger', 'amount' => 4.50 }
            ],
            'total' => 6.00
          },
          {
            'id' => second_sale.id,
            'items' => [
              { 'name' => 'milkshake', 'amount' => 2.50 },
              { 'name' => 'burger', 'amount' => 4.50 },
              { 'name' => 'chips', 'amount' => 2.00 }
            ],
            'total' => 9.00
          }
        ]
      }

      before { get '/sales' }

      it { expect(response).to be_success }

      it 'should return an array of sales' do
        expect(json).to eql(expected_sales_array)
      end
    end
  end

  describe 'show' do
    let(:sale) {
      Sale.create(
        total: 6.00,
        items: [
          { name: 'soft drink', amount: 1.50 },
          { name: 'burger', amount: 4.50 }
        ]
      )
    }

    let!(:expected_sales_object) {
      {
        'id' => sale.id,
        'total' => 6.00,
        'items' => [
          { 'name' => 'soft drink', 'amount' => 1.50 },
          { 'name' => 'burger', 'amount' => 4.50 }
        ]
      }
    }

    before { get "/sales/#{sale.id}" }

    it { expect(response).to be_success }

    it 'should return a sale object' do
      expect(json).to eql(expected_sales_object)
    end
  end

  describe 'create' do
    before do
      post '/sales', {
        sale: {
          items: [
            { name: 'soft drink', amount: 1.50 },
            { name: 'burger', amount: 4.50 }
          ]
        }
      }
    end

    it { expect(response).to be_success }

    it 'should return the total value of the created sale and its id' do
      expect(json).to eql({ 'id' => Sale.last.id, 'total' => 6.00 })
    end
  end
end
