module Faker
  class CPF
    
    class << self
      # Generates CPF a valid cpf number as a String with numbers only.
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

        # calculate second digit
        sum = (0..8).inject(0) do |sum, i|
          sum + cpf_root[i] * (11 - i)
        end

        sum += first_validator * 2

        second_validator = sum % 11
        second_validator = second_validator < 2 ? 0 : 11 - second_validator

        (cpf_root + [first_validator, second_validator]).to_s
      end
      alias number numeric
      alias numbers numeric


      # Generates CPF a valid cpf number as a String with numbers and standard separator digits.
      #
      # Example:
      #   Faker::CPF.number # => "059.893.186-42"
      def pretty
        numbers = numeric
        reg_match = numbers.match(/^(\d{3})(\d{3})(\d{3})(\d{2})$/)
        "#{reg_match[1]}.#{reg_match[2]}.#{reg_match[3]}-#{reg_match[4]}"
      end
      alias cpf pretty
      
    end

  end
end