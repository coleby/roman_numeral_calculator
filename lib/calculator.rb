# General purpose calculator taking string equations and outputting Integers or Decimals
# Takes an equation like: "4 * ( 10 + 6 )" and outputs it's result: 64
class Calculator
  OPERATIONS_IN_ORDER = ['*', '/', '+', '-'].freeze

  def initialize(equation)
    @equation_params = equation.split(' ')
  end

  def calculate(equation = @equation_params)
    return equation.first.to_i if equation.length == 1

    if equation.include?('(')
      # Determine start and ending for sub equation
      start_parens = equation.find_index('(')
      # Reverse order, so tweak the index to count from the end
      end_parens = equation.reverse.find_index(')') * -1 + -1

      parens_equation = equation[start_parens..end_parens]
      # Strip out the leading and trailing parens
      sub_equation = parens_equation[1..-2]

      # Recursively update sub equations to their results
      # [(, 4, +, 3, ), +, 12] will become [7 + 12]
      equation[start_parens..end_parens] = calculate(sub_equation)
    end

    equation = perform_operations(equation)

    format_int_or_float(equation.first)
  end

  # Performs all of the non-parens operations
  # [4, +, 11, *, 3] will become [37]
  def perform_operations(equation)
    remaining_operators = (OPERATIONS_IN_ORDER & equation)

    until remaining_operators.empty?
      equation = handle_operation(equation)

      remaining_operators = (OPERATIONS_IN_ORDER & equation)
    end

    equation
  end

  # Perform operation and replace in top level equation
  # IE - [4, *, 4] becomes [16]
  def handle_operation(equation)
    # Check for first of either multiplication or division
    multiply_or_division = equation.find_index { |o| o == '*' || o == '/' }
    # Then check for addition or subtraction
    addition_or_subtraction = equation.find_index { |o| o == '+' || o == '-' }

    # Multiplication/Division first, then try addition/subtraction
    operator_location = multiply_or_division || addition_or_subtraction

    # Grab operator to do the maths
    operator = equation[operator_location]

    # Locate the numbers it is operating on
    first_int = equation[operator_location - 1].to_f
    second_int = equation[operator_location + 1].to_f

    # Perform operation
    operator_result = first_int.send(operator, second_int)

    # Replace in complete array and remove surrounding numbers
    equation[operator_location] = operator_result
    equation.delete_at(operator_location + 1)
    equation.delete_at(operator_location - 1)
    equation
  end

  # Clean formatting for ints rather than decimals
  # IE - 4 instead of 4.0
  def format_int_or_float(final_value)
    final_value == final_value.to_i ? final_value.to_i : final_value
  end
end
