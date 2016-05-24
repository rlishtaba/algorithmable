require 'spec_helper'

describe Algorithmable::Cups::Stocks do
  let(:runtime) { Object.new.extend(Algorithmable::Cups::Stocks) }

  it 'can find best series buy and sell stocks [100, 180, 260, 310, 40, 535, 695]' do
    stocks = [100, 180, 260, 310, 40, 535, 695]
    transactions = runtime.ruby_buy_and_sell_stocks stocks
    transactions.each do |transaction|
      puts("Buy on day: #{transaction[:buy]} Sell on day: #{transaction[:sell]}")
    end

    series = [
      { buy: 0, sell: 3 },
      { buy: 4, sell: 6 }
    ]
    expect(transactions).to eq(series)
  end

  context 'find maximum profit' do
    it do
      stocks = [12, 15, 21, 17, 40, 10]
      mx = runtime.find_max_profit(stocks)
      expect(mx).to eq(28)
    end

    it 'can get best time' do
      stocks = [12, 15, 21, 17, 40, 10]
      best_time = runtime.get_best_time stocks
      expect(best_time).to eq(buy_at: 0, sell_at: 4, max_profit: 28)
    end
  end
end
