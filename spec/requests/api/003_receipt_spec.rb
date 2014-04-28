require 'spec_helper'

describe 'Exercise 3: Receipt API - Presenting a Sale Itemised along with Discounts' do

  describe 'show' do
    let(:sale) {
      Sale.create!(
        'total' => 12.50,
        'items' => [
          { 'name' => 'soft drink', 'price' => 1.50 },
          { 'name' => 'burger', 'price' => 4.50, 'discount' => { 'reason' => 'meal deal', 'amount' => 1.00 } },
          { 'name' => 'chips', 'price' => 2.00, 'discount' => { 'reason' => 'meal deal', 'amount' => 0.50 } },
          { 'name' => 'milkshake', 'price' => 2.50 },
          { 'name' => 'burger', 'price' => 4.50, 'discount' => { 'reason' => 'student discount', 'amount' => 1.00 } }
        ]
      )
    }

    let(:receipt_object) {
      {
        'items' => [
          { 'name' => 'soft drink', 'price' => 1.50 },
          { 'name' => 'burger', 'price' => 4.50 },
          { 'name' => 'chips', 'price' => 2.00},
          { 'name' => 'milkshake', 'price' => 2.50},
          { 'name' => 'burger', 'price' => 4.50}
        ],
        'item_total' => 15.00,
        'discounts' => [
          { 'reason' => 'meal deal', 'amount' => 1.50 },
          { 'reason' => 'student discount', 'amount' => 1.00}
        ],
        'discount_total' => 2.50,
        'total' => 12.50
      }
    }

    before { get "/receipts/#{sale.id}" }

    it { expect(response).to be_success }

    it 'returns a properly formatted receipt object' do
      expect(json).to eql(receipt_object)
    end

  end

end
