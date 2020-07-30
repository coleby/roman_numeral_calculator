require_relative 'calculator'
require_relative 'roman_numeral'

# This class puts together parsing, roman numeral conversion, and calculation
# Pass it an equation like: "IV * ( X + VI )" and it'll return: 64
class RomanCalculator
  OPERATORS = ['*', '-', '/', '+', '(', ')'].freeze

  def initialize(equation)
    @equation = equation
  end

  def calculate
    integer_equation = parse
    Calculator.new(integer_equation).calculate
  end

  # Convert Roman numerals to integers and leave operators alone
  def parse
    individual_parameters = @equation.split(' ')

    integer_equation = individual_parameters.map do |param|
      next param if OPERATORS.include?(param)

      RomanNumeral.new(param).to_int
    end

    integer_equation.join(' ')
  end
end
