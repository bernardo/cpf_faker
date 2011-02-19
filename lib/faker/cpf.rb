module Faker
  class CPF
    
    class << self
      # Generates a valid CPF number with numbers only. Returns a String (since it might contain leading zeros).
      #
      # Example:
      #   Faker::CPF.number # => "11438374798"
      def numeric
        cpf_root = Array.new(9) { rand(10) }

        # calculate first digit
        sum = (0..8).inject(0) do |sum, i|
          sum + cpf_root[i] * (10 - i)
        end

        first_validator = sum % 11
        first_validator = first_validator < 2 ? 0 : 11 - first_validator
        cpf_root << first_validator

        # calculate second digit
        sum = (0..8).inject(0) do |sum, i|
          sum + cpf_root[i] * (11 - i)
        end

        sum += first_validator * 2

        second_validator = sum % 11
        second_validator = second_validator < 2 ? 0 : 11 - second_validator
        (cpf_root << second_validator).join
      end
      alias number numeric
      alias numbers numeric

      # Generates a valid CPF number with numbers and separators. Returns a String.
      #
      # Example:
      #   Faker::CPF.number # => "059.893.186-42"
      def pretty
          cpf_numbers = numeric
          "%s.%s.%s-%s" % [cpf_numbers[0..2], cpf_numbers[3..5], cpf_numbers[6..8], cpf_numbers[9..10]]
      end
      alias cpf pretty
      alias formatted pretty
      
    end

  end
end
