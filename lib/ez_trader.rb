require 'json'
require 'bittrex'

puts "Hi there! Welcome to EZ Trader (Bittrex).\n\n"
puts "This will display the prices of coins per minute.\n"
puts "Press CTRL-C to termiante the app.\n--"

loop do
  @quote = Bittrex::Quote.current('BTC-BAT')
  puts "The current LAST of BAT: #{@quote.last}"
  sleep 60
end
