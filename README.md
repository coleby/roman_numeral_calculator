# Roman Numeral Calculation

Implement a calculator that takes its input as a string, with numbers written as Roman Numerals, and outputs the result as a decimal value. Your solution should obey the standard order of operations, and should support `+` , `-` , `*` , `/` and parentheses.

## Tackling this problem

At first glance, it seems pretty straight forward - Convert to Roman Numerals to Integers and then calculate. However, we can't just pass the equation to a calculator, we need to determine the order of operations and make sure the equation is operated on in that order.

### Roman Numerals to Integers

The logic here is to store the value of each character in a hash. IE - X: 10.

Then we need to loop through the input characters, convert to integer, then add them up.

If there is a character with a value less than the next character, that symbolizes that we need to subtract the smaller value from the greater value. The edge case here is that the smaller value must be an order of 10: I, X, C, etc.

There is an additional edge case to note - No character should repeat more than 3 times.

If any edge case is hit, it's an improperly formatted roman numeral

### Calculator

The tricky part here is nested parens. Each of those is technically a sub equation needing to be solved.

So logically, tackling those recursively just makes sense. While it is a little trickier to actually implement, the end result is much clearer.

To simply explain the process here, the code is essentially merging a ton of sub equations following the order of operations. We'll take `(4 + 3)` and turn it into `7`. In a large equation it works like so:

Starting with: `4 + 3 * 9 - 3 / 3 + ( 5 - 2 )`
It'll work like so:  
`4 + 3 * 9 - 3 / 3 + 3`  
`4 + 27 - 3 / 3 + 3`  
`4 + 27 - 1 + 3`  
`31 - 1 + 3`  
`30 + 3`  
`33`  


## Using this tool

```ruby
$ ruby roman_calc.rb "I + IV"
=> 5
```

## Testing

Let me just say, I miss rspec. But to run the tests:

```ruby
$ ruby test.rb
Testing Conversion Cases - Roman Numeral to Int
Testing II : 2 == 2: true
Testing XVII : 17 == 17: true
Testing XIV : 14 == 14: true
Testing CMXC : 990 == 990: true

Testing Parser
Testing II : 2 == 2: true
Testing VI : 6 == 6: true
Testing IV : 4 == 4: true
...
```

## About

This tool was written without any outside gems required, only core ruby library. The calculator portion is also entirely custom rather than relying on core ruby libraries for handling order of operations
