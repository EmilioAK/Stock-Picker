def stock_picker(prices)
    profit = 0
    buy_and_sell_dates = []
    
    prices.each_with_index do |buy_price, buy_date|
        sell_prices = prices[buy_date..-1] # Prices that happen after the purchase
        
        sell_prices.each_with_index do |sell_price, sell_date|
            sell_date += buy_date # sell_date is always offset by buy_date amount since sell_prices is spliced
            this_profit = sell_price - buy_price
            
            if this_profit > profit
                profit = this_profit
                buy_and_sell_dates[0] = buy_date
                buy_and_sell_dates[1] = sell_date
            end
        end
    end
    
    return buy_and_sell_dates
end