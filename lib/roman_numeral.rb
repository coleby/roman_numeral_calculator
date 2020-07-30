# Converts Roman Numeral Strings into Integers
# This assumes the Roman Numeral is properly formatted.
# If we need to guard against bad input, we'll need to add additional validation logic
class RomanNumeral
  VALUE_MAP = {
    I: 1,
    V: 5,
    X: 10,
    L: 50,
    C: 100,
    D: 500,
    M: 1000
  }.freeze

  def initialize(numeral)
    @numeral = numeral
  end

  def to_int
    characters = @numeral.split('')
    result = 0
    index = 0

    while index < characters.length
      current_value = VALUE_MAP[characters[index].to_sym]
      next_value = VALUE_MAP[characters[index + 1].to_sym] if characters[index + 1]

      # Check if the next value is greater than current
      # If it is, we need to subtract
      if next_value && current_value < next_value
        result += (next_value - current_value)
        index += 1
      else
        result += current_value
      end

      index += 1
    end

    result
  end
end
