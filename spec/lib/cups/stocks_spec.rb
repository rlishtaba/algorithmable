require 'spec_helper'

describe Algorithmable::Cups::Stocks do
  let(:runtime) { Object.new.extend(Algorithmable::Cups::Stocks) }

  it 'can find best series buy and sell stocks [100, 180, 260, 310, 40, 535, 695]' do
    stocks = [100, 180, 260, 310, 40, 535, 695]
    transactions = runtime.ruby_buy_and_sell_stocks stocks
    transactions.each do |transaction|
      puts("Buy on day: #{transaction[:buy]} Sell on day: #{transaction[:sell]}");
    end

    series = [
        {buy: 0, sell: 3},
        {buy: 4, sell: 6}
    ]
    expect(transactions).to eq(series)
  end
end