require 'json'
require 'bittrex'

puts "Hi there! Welcome to EZ Trader (Bittrex).\n\n"
puts "This will display the prices of coins per minute.\n"
puts "Press CTRL-C to termiante the app.\n--"

# Bittrex API Keys
Bittrex.config do |c|
  c.key = ENV['BITTREX_API_KEY']
  c.secret = ENV['BITTREX_SECRET_KEY']
end

# Extract non-zero balance 
def get_non_zero_wallet(my_wallet)
  my_wallet.delete_if do |coin|
    if coin.balance == 0
      true
    else
      false
    end
  end
  my_wallet
end

my_wallet = get_non_zero_wallet(Bittrex::Wallet.all)
puts "Your current wallet: #{my_wallet}\n"

# Calls Bittrex API per minute
loop do
  @quote = Bittrex::Quote.current('BTC-BAT')
  puts "The current LAST of BAT: #{@quote.last}"
  sleep 60
end