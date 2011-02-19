module Faker
  class CNPJ
    class << self
      # Generates a valid CNPJ number with numbers only. Returns a string, since it may have leading zeros.
      #
      # Example:
      #  Faker::CNPJ.numeric  #=> "57222068000132"
      def numeric
        cnpj_root = Array.new(12) { rand(10) }
        
        # calculate first digit
        factor = [5, 4, 3, 2, 9, 8, 7, 6, 5, 4, 3, 2]

        sum = (0..11).inject(0) do |sum, i|
          sum + cnpj_root[i] * factor[i]
        end

        first_validator = sum % 11
        cnpj_root << first_validator = first_validator < 2 ? 0 : 11 - first_validator

        # calculate second digit
        factor.unshift 6

        sum = (0..12).inject(0) do |sum, i|
          sum + cnpj_root[i] * factor[i]
        end

        second_validator = sum % 11
        (cnpj_root << second_validator = second_validator < 2 ? 0 : 11 - second_validator).join
      end
      alias numbers numeric
      alias number numeric
      
      # Generates a valid CNPJ number, including separators. Returns a string.
      #
      # Example:
      #  Faker::CNPJ.numeric  #=> "22.792.949/0001-04"
      def pretty
        cnpj = numeric.to_s.rjust(14, "0")
        "%s.%s.%s/%s-%s" % [cnpj[0,2], cnpj[2,3], cnpj[5,3], cnpj[8,4], cnpj[12,2]]
      end
      alias cnpj pretty
      alias formatted pretty
      
    end
  end
end
