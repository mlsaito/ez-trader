# ez-trader
A simple Bittrex trader bot.
## Setup on Local Environment
1. git clone https://github.com/mlsaito/ez-trader.git
2. cd ez-trader
3. bundle install
## To Run App Locally
1. ruby lib/ez-trader.rb
## Description
This app aims to sell coins on a specified growth threshold.

### Flow:

1. We buy > ~20% change alt coins which has sure value and is sure going to go up. This is a manual procedure.
2. Script polls our bittrex portfolio (poll = checks every x minutes), and see if price of a coin went up ~20% change from buy rate. Say I bought 5k sats at BAT, checks if BAT already has ~20% growth. Threshold configurable.
3. Sell if condition is met. If not, back to 2.
4. Notify us through text: “Your <alt_coin> has been sold at <rate> with <n% profit>. Please buy alt coins with negative % growth again.”
  
Note: Do not forget to set a stop-loss threshold/order.
  
### We can automate 1 by (Next Iteration):

1. Set a list of alt coins to watch.
2. Script calculates the % growth of each coin per minute. % growth: by definition, is by the last 24 hours. Note: Bittrex does not give this info from their API so we have to solve this on our own).
3. If % growth of a coin is > ~20%, buy that coin. (We might have to set how much will the script buy, which can be a point of discussion).
