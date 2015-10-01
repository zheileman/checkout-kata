Notes for running the code:
===========================

There should not be any problem at all as I didn't use anything fancy on porpuse. 
Everything is plain ruby and the only thing that might be neccessary is bundler.
The ruby version should not be important, any 2.x will be fine, but my current 
version is 2.2.0

For running the tests: $ rake test (or just rake)  
Here is a complete output:  

~/p/supermarket ❯❯❯ rake test  

CheckoutService
  #init_checkout
    clears the scanned items buffer and subtotal
  #scan
    add the item to the scanned items buffer
  #calculate_total
    uses the pricing ruleset to calculate a given list of items

CheckoutServiceIntegration
  #calculate_total
    buying 1xA
      returns a total price of 50
    buying 3xA
      returns a total price of 130
    buying 4xA
      returns a total price of 180
    buying 1xA, 1xB, 1xC, 1xD
      returns a total price of 115
    buying 3xA and 1xC in random order
      returns a total price of 150
    buying 3xA and 3xB in random order
      returns a total price of 205

PriceRule
  apply rule when there is a special pricing
    returns the total price for all items meeting this price rule
  apply rule when there is not a special pricing
    returns the total price for all items meeting this price rule

PricingRuleSet
  #calculate without rules
    returns 0 for an empty rules list
  #calculate with rules
    apply each of the pricing rules, passing the items list

Finished in 0.02475 seconds (files took 0.14985 seconds to load)
13 examples, 0 failures