module Faker
  class CPFInvalid
    
    class << self
      # Generates an invalid CPF number with numbers only. Returns a String (since it might contain leading zeros).
      #
      # Example:
      #   Faker::CPFInvalid.number # => "11438374798"
      def numeric
        cpf_root = Array.new(11) { rand(10) }
      end
      alias number numeric
      alias numbers numeric

      # Generates an invalid CPF number with numbers and separators. Returns a String.
      #
      # Example:
      #   Faker::CPFInvalid.number # => "059.893.186-42"
      def pretty
          cpf_numbers = numeric
          "%s.%s.%s-%s" % [cpf_numbers[0..2], cpf_numbers[3..5], cpf_numbers[6..8], cpf_numbers[9..10]]
      end
      alias cpf pretty
      alias formatted pretty
      
    end

  end

end
