require_relative 'lib/roman_calculator.rb'

equation = ARGV[0]

unless equation&.is_a?(String) && ARGV[1].nil?
  puts 'Use the program like below...'
  puts '-------------'
  puts '$ ruby roman_calc.rb "I + IV"'
  puts '=> 5'
  return
end

puts RomanCalculator.new(equation).calculate
