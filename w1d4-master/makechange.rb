# def make_change(amount, coins)
#   return [] if coins.empty?
#
#   # First, do the traditional American money thing: take as many of the biggest coin as you can. Then do a recursion on the remaining amount, leaving out the biggest kind of coin.
#
#   coin = coins[0]
#   coin_frequency = amount/coin
#
#   left_over = amount - (coin * coin_frequency)
#
#   coin_array = []
#
#   coin_frequency.times { coin_array << coin }
#   coin_array.concat(make_change(left_over, coins.drop(1)))
#
# end
#
#
def make_change_new(amount, coins)
  if amount < coins[-2]
    ones_array =[]
    amount.times {ones_array << coins[-1]}
    return ones_array
  end
  # return [] if amount == 0

  best_change = nil

  coins.each do |coin|
    next if amount < coin
    next if coin == 1

    change = [coin]
    remaining_change = make_change_new(amount - coin, coins)
    change = change + remaining_change


    if best_change.nil? || change.length < best_change.length
      best_change = change
    end
  end

  best_change

end
# #
# # def make_change_best(amount, coins)
# #   coin_arrays = []
# #   coin_arrays << make_change_one_by_one(amount, coins)
# #   coin_arrays << make_change_one_by_one(amount, coins.drop(1))
# #   coin_arrays << make_change_one_by_one(amount, coins.drop(2))
# # end
# #
# #
# # # def make_change_best(amount, coins)
# # #   coin = coins[0]
# # #   coin_array = []
# # #   coin_arrays = []
# # #
# # #   if coins.length == 1 || amount < coins[-2]
# # #     (amount/coin).times {coin_array << coin}
# # #     return coin_array
# # #   end
# # #
# # #   if amount > coin
# # #     coin_array << coin
# # #     amount -= coin
# # #   end
# # #
# # #   if amount > coin
# # #     coins = coins.drop(1)
# # #   end
# #
# #   # n = 0
# #   # while coin*n < amount
# #         # n.times {coin_array << coin}
# #         # new_amount = amount - n*coin
# #         # new_coins = coins.drop(1)
# #   # p coin_arrays << coin_array.concat(make_change(amount, coins))
# #   coin_arrays << (make_change_one_by_one(amount, coins))
# #   p coin_arrays
# #   coin_arrays
# #   #   n += 1
# #   # end
# #
# # end
#
# # def make_change_best(amount, coins)
# #   if coins.length == 1 || amount < coins[-2]
# #     (amount/coin).times {coin_array << coin}
# #     return coin_array
# #   end
# #
# #   coin = coins[0]
# #   n = 1
# #   coin_arrays = []
# #
# #
#
# #     coin_arrays << coin_array.concat(make_change_one_by_one(new_amount, new_coins))
# #
# #
# #
# #   coin_arrays
# #
# #   #
# #   #
# #   # coin_array.concat(make_change_best(amount, coins))
# # end
#
# # make_change_best(42, [10,7, 1])
#
#   # In each call to make_change, iterate through the possible coins; first take one of the biggest, and then make a recursive call on the remaining amount.
#   # Record this way of making change.
#   # But don't stop yet; next, take one of the second-biggest coin, and try to make change for the remainder.
#   # If this uses fewer coins than the previous solution, replace your "current best" solution. Don't stop until you iterate through all the coins.
#
#
#
# # def change(amount,coins)
# #   coins_array = make_change(amount, coins)
# #   remainder = amount % coins[0]
# #   n = 0
# #
# #   until (coins[1] * n) % coins[0] == remainder
# #     n += 1
# #   end
# #
# #   new_amount = amount - (coins[1] * n) && amount
# #   alternate_array = Array.new(n, coins[1])
# #   additional_coins = make_change(new_amount, coins)
# #   (alternate_array.concat(additional_coins)).sort!{|x,y| y <=> x}
# #
# #   coins_array.length < alternate_array.length ? coins_array : alternate_array
# # end
# #
# # def factors(num)
# #   (1..num).select{|x| num % x == 0}
# # end
# #
# # def places(num)
# # end
# #
# #
# # def create_arrays(array)
# #   value = array.pop
# #   start_array = value
# #   arrays =
# #
# # end
# def my_combo(array, n)
#   arrays = []
#
#   array = Array.new(n, array).flatten
#   array.combination(n).to_a
# end
#
#
# def combo(target, array)
#   n = 1
#   loop do
#     my_combo(array, n).each do |combo|
#       p combo
#       if combo.inject(:+) == target
#         return combo
#       end
#     end
#     n += 1
#   end
#
# end
#
#   # base case
#   # input (n, [1])
#   # output [1,1,1,1,1,1,1]
#
#   # previous (n, [7, 1 ] )
#
# def new_change(amount, coins)
#   coins_array = []
#   if coins.length == 1
#     (amount / coins[0]).times {coins_array << coins[0]}
#   end
#
#   coin_arrays = []
#   coins arrays << coins_array
#
#   last_array == new_change(n, [1])
#
#   checking_array = last_array.select{|x| x< coins[0]}
#   not_changed = last_array.select{|x| x>= coins[0]}
#
#   while checking_array.inject(:+) >= coins[0]
#
#   end
#
#
# end


def make_change(amount, coins = [25,10,5,1])
  return [] if amount == 0

  best_change = nil
  coins.each do |coin|
    next if coin > amount

    change_for_rest = make_change(amount - coin, coins)
    change = [coin] + change_for_rest

    if best_change.nil? || change.count < best_change.count
      best_change = change
    end
  end

  best_change
end
