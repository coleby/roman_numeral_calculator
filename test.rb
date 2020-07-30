Dir['./lib/*.rb'].each { |file| require file }

# This file's a mess. But I wanted a clean non-rspec way of adding test cases.
# This tests each separate component that went into solving this problem.

CONVERSION_TEST_CASES = {
  'II' => 2,
  'XVII' => 17,
  'XIV' => 14,
  'CMXC' => 990
}.freeze

puts 'Testing Conversion Cases - Roman Numeral to Int'

CONVERSION_TEST_CASES.each do |test, answer|
  result = RomanNumeral.new(test).to_int
  puts "Testing #{test} : #{answer} == #{result}: #{result == answer}"
end

puts ''
puts 'Testing Parser'

PARSER_TEST_CASES = {
  'II' => '2',
  'VI' => '6',
  'IV' => '4',
  'I - II' => '1 - 2',
  'I / II' => '1 / 2',
  'I + II + III' => '1 + 2 + 3',
  'I * II * III' => '1 * 2 * 3',
  'X * IV' => '10 * 4',
  '( I + II ) * III' => '( 1 + 2 ) * 3',
  'IV * ( X + VI )' => '4 * ( 10 + 6 )',
  'CMXC - XIV' => '990 - 14'
}

PARSER_TEST_CASES.each do |test, answer|
  result = RomanCalculator.new(test).parse
  puts "Testing #{test} : #{answer} == #{result}: #{result == answer}"
end

puts ''
puts 'Testing Calculator'

CALCULATOR_TEST_CASES = {
  '2' => 2,
  '6' => 6,
  '4' => 4,
  '1 - 2' => -1,
  '1 / 2' => 0.5,
  '1 + 2 + 3' => 6,
  '1 * 2 * 3' => 6,
  '10 * 4' => 40,
  '( 1 + 2 ) * 3' => 9,
  '4 * ( 10 + 6 )' => 64,
  '990 - 14' => 976,
  '4 + 3 * 9 - 3 / 3 + ( 5 - 2 )' => 33,
  '4 + 3 * 9 - 3 / 3 - ( 5 + 2 )' => 23
}

CALCULATOR_TEST_CASES.each do |test, answer|
  result = Calculator.new(test).calculate
  puts "Testing #{test} : #{answer} == #{result}: #{result == answer}"
end

puts ''
puts 'Testing Roman Calculator'

ROMAN_CALCULATOR_TEST_CASES = {
  'II' => 2,
  'VI' => 6,
  'IV' => 4,
  'I - II' => -1,
  'I / II' => 0.5,
  'I + II + III' => 6,
  'I * II * III' => 6,
  'X * IV' => 40,
  '( I + II ) * III' => 9,
  'IV * ( X + VI )' => 64,
  'CMXC - XIV' => 976
}

ROMAN_CALCULATOR_TEST_CASES.each do |test, answer|
  result = RomanCalculator.new(test).calculate
  puts "Testing #{test} : #{answer} == #{result}: #{result == answer}"
end
