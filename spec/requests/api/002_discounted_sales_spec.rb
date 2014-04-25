require 'spec_helper'

describe 'Exercise 2: Sales API - Discounted Transactions' do

  describe 'create' do
    context 'with a discounted item' do
      before do
        post '/sales', {
          sale: {
            items: [
              {
                name: 'burger',
                price: 4.50,
                discount: {
                  reason: 'student discount', amount: 1.00
                }
              }
            ]
          }
        }
      end

      it { expect(response).to be_success }

      it 'should return the total value of the created sale and its id' do
        expect(json).to eql({ 'id' => Sale.last.id, 'total' => 3.50 })
      end
    end

    context 'with a mix of discounted and non-discounted items' do
      before do
        post '/sales', {
          sale: {
            items: [
              {
                name: 'burger',
                price: 4.50,
                discount: {
                  reason: 'student discount', amount: 1.00
                }
              },
              {
                name: 'milkshake',
                price: 2.50
              },
              {
                name: 'chips',
                price: 2.00
              }
            ]
          }
        }
      end

      it { expect(response).to be_success }

      it 'should return the total value of the created sale and its id' do
        expect(json).to eql({ 'id' => Sale.last.id, 'total' => 8.00 })
      end
    end
  end

end
